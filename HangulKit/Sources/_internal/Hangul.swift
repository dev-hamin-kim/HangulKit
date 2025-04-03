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
    
    // 이해하기 힘든 binaryAssembleAlphabets라는 함수명보다, Swift에서 지속적으로 사용해왔던 함수명을 차용.
    
    ///  두 개의 한글 자모를 합칩니다. 완성된 한글 문자는 취급하지 않습니다.
    ///  ```
    ///  binaryAssembleAlphabets('ㄱ', 'ㅏ') // 가
    ///  binaryAssembleAlphabets('ㅗ', 'ㅏ') // ㅘ
    ///  ```
    static func reduce(lhs: String, rhs: String) -> String {
        return String()
    }
}

//extension CharacterSet {
//    static var hangul: CharacterSet {
//        var characterSet: CharacterSet = []
//        characterSet.formUnion(.init(charactersIn: "가"..."힣"))
//        return characterSet
//    }
//}

