//
//  Hangul.swift
//  HangulKit
//
//  Created by 김하민 on 3/11/25.
//

//import Foundation

public extension Hangul {
    
    static func isHangulCharacter(_ input: Character) -> Bool {
        // 타입 선언 생략 시 컴파일러가 ClosedRange<String>으로 추론함.
        let rangeOfHangul: ClosedRange<Character> = "가"..."힣"
        
        return rangeOfHangul.contains(input)
    }
    
    static func isHangulAlphabet(_ input: Character) -> Bool {
        let rangeOfHangulAlphabet: ClosedRange<Character> = "ㄱ"..."ㅣ"
        
        return rangeOfHangulAlphabet.contains(input)
    }
    
    static func isHangul(_ string: String) -> Bool {
        return string.range(of: "\\p{Hangul}", options: .regularExpression) != nil
    }
    
    // es-hangul은 assertHangul이라는 함수가 있으나,
    // Swift의 특성 상, 필요하지 않을 것으로 생각되어 구현하지 않았음.
    // isHangul만 사용해도 충분하다고 결론. parseHangul과 safeParseHangul도 동일.
    
    /// 연음 법칙을 적용하여 두 개의 한글 문자를 연결합니다.
    static func linkHangulCharacters(_ lhs: Character, _ rhs: Character) -> String {
        var sourceJamo = disassembleToGroups(lhs.description)[0]
        let lastJamo = sourceJamo.removeLast()
        
        var result = removeLastCharacter(lhs.description)
        try! result.append(combineCharacter(choseong: lastJamo, jungseong: rhs))

        return result
    }
}

//extension CharacterSet {
//    static var hangul: CharacterSet {
//        var characterSet: CharacterSet = []
//        characterSet.formUnion(.init(charactersIn: "가"..."힣"))
//        return characterSet
//    }
//}

