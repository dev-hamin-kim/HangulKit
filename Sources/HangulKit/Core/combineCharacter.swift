//
//  combineCharacter.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

public extension HangulKit {
    /// 인자로 초성, 중성, 종성을 받아 하나의 한글 문자를 반환합니다.
    ///
    ///     let 값 = HangulKit.combineCharacter(choseong: "ㄱ", jungseong: "ㅏ", jongseong: "ㅄ")
    ///     print(값) // prints "값"
    ///
    ///     let 토 = HangulKit.combineCharacter(choseong: "ㅌ", jungseong: "ㅗ")
    ///     print(토) // prints "토"
    static func combineCharacter(choseong: Character,
                                 jungseong: Character,
                                 jongseong: Character? = nil) -> Character? {
        
        guard canBeChoseong(choseong),
              canBeJungseong(jungseong),
              canBeJongseong(jongseong) else { return nil }
        
        let chosungIndex = Choseong.list.firstIndex(of: choseong)!
        let jungsungIndex = Jungseong.list.firstIndex(of: jungseong)!
        let jongsungIndex = Jongseong.list.firstIndex(of: jongseong) ?? 0 // nil일 경우 받침 없이 처리
        
        let choseongOfTargetConsonant = chosungIndex * Jungseong.list.count * Jongseong.list.count
        let choseongOfTargetVowel = jungsungIndex * Jongseong.list.count
        
        let unicodeValue: UInt32 =
        HangulKit.CompleteHangulStartUnicodeScalar +
        UInt32(jongsungIndex + choseongOfTargetConsonant + choseongOfTargetVowel)
        
        return Character(Unicode.Scalar(unicodeValue)!)
    }
    
    /// 인자로 Syllable 구조체를 받아 하나의 한글 Character를 반환합니다.
    ///
    ///     let syllable = Syllable(choseong: "ㄱ", jungseong: "ㅏ", jongseong: "ㅇ")
    ///     let 강 = combineCharacter(syllable)
    ///     print(강) // prints "강"
    static internal func combineCharacter(_ syllable: Syllable) -> Character? {
        return combineCharacter(choseong: syllable.choseong, jungseong: syllable.jungseong, jongseong: syllable.jongseong)
    }
}
