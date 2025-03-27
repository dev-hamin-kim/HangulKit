//
//  combineCharacter.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

public extension Hangul {
    
    enum CombineCharacterError: Error {
        case invalidChoseong, invalidJungseong, invalidJongseong
    }
    
    ///
    /// 인자로 초성, 중성, 종성을 받아 하나의 한글 문자를 반환합니다.
    ///
    /// ```
    /// combineCharacter('ㄱ', 'ㅏ', 'ㅂㅅ') // '값'
    /// combineCharacter('ㅌ', 'ㅗ') // '토'
    static func combineCharacter(choseong: Character,
                                 jungseong: Character,
                                 jongseong: Character? = nil) throws -> Character {
        
        guard canBeChoseong(choseong) else { throw CombineCharacterError.invalidChoseong }
        guard canBeJungseong(jungseong) else { throw CombineCharacterError.invalidJungseong }
        guard canBeJongseong(jongseong) else { throw CombineCharacterError.invalidJongseong }
        
        let chosungIndex = Choseong.list.firstIndex(of: choseong)!
        let jungsungIndex = Jungseong.list.firstIndex(of: jungseong)!
        let jongsungIndex = Jongseong.list.firstIndex(of: jongseong)
        
        let choseongOfTargetConsonant = chosungIndex * Jungseong.count * Jongseong.count
        let choseongOfTargetVowel = jungsungIndex * Jongseong.count
        
        let unicodeValue: UInt32 =
        Hangul.CompleteHangulEndUnicodeScalar +
        UInt32(jongsungIndex! + choseongOfTargetConsonant + choseongOfTargetVowel)
        
        return Character(Unicode.Scalar(unicodeValue)!)
    }
}
