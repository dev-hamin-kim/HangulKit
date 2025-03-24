//
//  disassembleCompleteCharacter.swift
//  HangulKit
//
//  Created by 김하민 on 3/24/25.
//

public extension Hangul {
    
    
    
    /// 완전한 한글 문자열을 초성, 중성, 종성으로 분리합니다.
    ///
    static func disassembleCompleteCharacter(letter: Character) throws
    -> (choseong: Character, jungseong: Character, jongseong: Character) {
        
        guard isHangul(letter.description) else { throw InputError.notAHangul }
        
        let charCode = letter.unicodeScalars.first!.value
        
        let hangulCode = charCode - Hangul.CompleteHangulStartUnicodeScalar
        
        let jongseongIndex = hangulCode % Hangul.NumberOfJongseong
        let jungseongIndex = ((hangulCode - jongseongIndex) / Hangul.NumberOfJongseong) % Hangul.NumberOfJungseong
        let choseongIndex = (hangulCode - jongseongIndex) / Hangul.NumberOfJongseong / Hangul.NumberOfJungseong
        
        let result = (choseong: Hangul.Choseong.list[Int(choseongIndex)],
                      jungseong: Hangul.Jungseong.list[Int(jungseongIndex)],
                      jongseong: Hangul.Jongseong.list[Int(jongseongIndex)])
        
        return result
    }
}
