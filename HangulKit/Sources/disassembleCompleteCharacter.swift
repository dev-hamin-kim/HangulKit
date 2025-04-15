//
//  disassembleCompleteCharacter.swift
//  HangulKit
//
//  Created by 김하민 on 3/24/25.
//

public extension Hangul {
    
    struct DisassembledCharacter: Equatable {
        let choseong: Character
        let jungseong: Character
        let jongseong: Character?
        
        init(choseong: Character, jungseong: Character, jongseong: Character? = nil) {
            self.choseong = choseong
            self.jungseong = jungseong
            self.jongseong = jongseong
        }
        
        static public func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.choseong == rhs.choseong && lhs.jungseong == rhs.jungseong && lhs.jongseong == rhs.jongseong
        }
    }
    
    /// 완전한 한글 문자열을 초성, 중성, 종성으로 분리합니다.
    ///
    static func disassembleCompleteCharacter(_ letter: Character) throws -> DisassembledCharacter {
        
        guard CompleteHangulStartUnicodeScalar <= letter.unicodeScalars.first!.value
                && letter.unicodeScalars.first!.value <= CompleteHangulEndUnicodeScalar
                // "가"..."힣".contains(letter.description)보다 효율적인가...?
        else { throw InputError.notACompletedHangul }
        
        let charCode = letter.unicodeScalars.first!.value
        
        let hangulCode = charCode - Hangul.CompleteHangulStartUnicodeScalar
        
        let jongseongIndex = hangulCode % Hangul.NumberOfJongseong
        let jungseongIndex = ((hangulCode - jongseongIndex) / Hangul.NumberOfJongseong) % Hangul.NumberOfJungseong
        let choseongIndex = (hangulCode - jongseongIndex) / Hangul.NumberOfJongseong / Hangul.NumberOfJungseong
        
        let result = DisassembledCharacter(choseong: Hangul.Choseong.list[Int(choseongIndex)],
                      jungseong: Hangul.Jungseong.list[Int(jungseongIndex)],
                      jongseong: Hangul.Jongseong.list[Int(jongseongIndex)])
        
        return result
    }
}
