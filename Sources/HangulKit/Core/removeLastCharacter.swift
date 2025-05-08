//
//  removeLastCharacter.swift
//  HangulKit
//
//  Created by 김하민 on 3/28/25.
//

public extension HangulKit {
    /// 주어진 한글 문자열에서 가장 마지막 문자 하나를 제거하여 반환합니다.
    ///
    ///     HangulKit.removeLastCharacter("안녕하세요 값") // returns "안녕하세요 갑"
    ///     HangulKit.removeLastCharacter("아이오에스") // returns "아이오에ㅅ"
    ///     HangulKit.removeLastCharacter("일요일") // returns "일요이"
    ///     HangulKit.removeLastCharacter("전화") // returns "전호"
    ///     HangulKit.removeLastCharacter("신세계") // returns "신세ㄱ"
    static func removeLastCharacter(in words: String) -> String {
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
                result = try! combineCharacter(choseong: first, jungseong: HangulKit.assembledVowels["\(second)\(third)"]!)
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
                result = try! combineCharacter(choseong: first, jungseong: HangulKit.assembledVowels["\(second)\(third)"]!, jongseong: fourth)
            } else {
                result = try! combineCharacter(choseong: first, jungseong: second, jongseong: HangulKit.assembledConsonants["\(third)\(fourth)"])
            }
            
        default: return ""
        }
        
        return [words.dropLast(1).description, result?.description ?? ""].joined()
    }
    
    // MARK: popLastCharacter 메서드 추가...?
    // collection의 메서드 removeLast/popLast처럼...?
    // 제거한 문자 하나를 반환하는...?
}
