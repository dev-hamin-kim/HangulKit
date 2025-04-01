//
//  removeLastCharacter.swift
//  HangulKit
//
//  Created by 김하민 on 3/28/25.
//

public extension Hangul {
    
    /// 인자로 주어진 한글 문자열에서 가장 마지막 문자 하나를 제거하여 반환합니다.
    ///  
    /// ```
    /// removeLastCharacter("안녕하세요 값") // 안녕하세요 갑
    /// removeLastCharacter("아이오에스") // 아이오에ㅅ
    /// removeLastCharacter("일요일") // 일요이
    /// removeLastCharacter("전화") // 전호
    /// removeLastCharacter("신세계") // 신세ㄱ
    /// ```
    static func removeLastCharacter(_ words: String) -> String {
        let lastCharacter = words.last
        
        guard let lastCharacter else { return "" }
        guard isHangul(lastCharacter.description) else { return words.dropLast(1).description }
        
        let decomposedLastCharacter = disassembleToGroups(lastCharacter.description)[0].dropLast()
        var result: Character?
        
        switch decomposedLastCharacter.count {
        case 0: result = nil
        case 1: result = decomposedLastCharacter[0]
        case 2:
            let choseong = decomposedLastCharacter[0] // 초성
            let jungseong = decomposedLastCharacter[1] // 중성 첫번째 모음
            
            result = try! combineCharacter(choseong: choseong, jungseong: jungseong)
            
        case 3:
            let first = decomposedLastCharacter[0] // 초성
            let second = decomposedLastCharacter[1] // 중성 첫번째 모음
            let third = decomposedLastCharacter[2] // 중성 두번째 모음 or 종성 첫번째 자음
            
            let thirdIsJungseong = canBeJungseong(third)
            
            if thirdIsJungseong {
                result = try! combineCharacter(choseong: first, jungseong: Hangul.assembledVowels["\(second)\(third)"]!)
            } else {
                result = try! combineCharacter(choseong: first, jungseong: second, jongseong: third)
            }
            
        case 4:
            let first = decomposedLastCharacter[0] // 초성
            let second = decomposedLastCharacter[1] // 중성 첫번째 모음
            let third = decomposedLastCharacter[2] // 중성 두번째 모음 or 종성 첫번째 자음
            let fourth = decomposedLastCharacter[3] // 종성 첫번째 자음 or 종성 두번째 자음
            
            let thirdIsJungseong = canBeJungseong(third)
            
            if thirdIsJungseong {
                result = try! combineCharacter(choseong: first, jungseong: Hangul.assembledVowels["\(second)\(third)"]!, jongseong: fourth)
            } else {
                result = try! combineCharacter(choseong: first, jungseong: second, jongseong: Hangul.assembledConsonants["\(third)\(fourth)"])
            }
            
        default: return ""
        }
        
        return [words.dropLast(1).description, result?.description ?? ""].joined()
    }
}
