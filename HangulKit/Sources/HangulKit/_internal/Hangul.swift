//
//  Hangul.swift
//  HangulKit
//
//  Created by 김하민 on 3/11/25.
//

import Foundation

public struct Hangul {
    
    // es-hangul에서의 이름은 isHangulCharacter이지만,
    // Swift의 특성 상
    // 음절을 의미하는 Syllable으로 변경하였음.
    public func isHangulSyllable(_ character: Character) -> Bool {
        // 타입 선언 생략 시 컴파일러가 ClosedRange<String>으로 추론함.
        let rangeOfHangul: ClosedRange<Character> = "가"..."힣"
        
        return rangeOfHangul.contains(character)
    }
    
    public func isHangulAlphabet(_ character: Character) -> Bool {
        let rangeOfHangulAlphabet: ClosedRange<Character> = "ㄱ"..."ㅣ"
        
        return rangeOfHangulAlphabet.contains(character)
    }
    
    public func isHangul(_ character: Character) -> Bool {
        return true
    }
    
}

extension CharacterSet {
    static var hangul: CharacterSet {
        var characterSet: CharacterSet = []
        characterSet.formUnion(.init(charactersIn: "가"..."힣"))
        return characterSet
    }
}

