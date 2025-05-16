//
//  disassembleCompleteCharacter.swift
//  HangulKit
//
//  Created by 김하민 on 3/24/25.
//

public extension HangulKit {
    
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
    
    /// 완전한 한글 문자를 초성, 중성, 종성으로 분리합니다.
    /// 입력된 문자가 완전한 한글 문자가 아닐 경우 nil을 반환합니다.
    ///
    ///     let 값 = HangulKit.disassembleCompleteCharacter("값")
    ///     print(값) // prints Optional(DisassembledCharacter(choseong: "ㄱ", jungseong: "ㅏ", jongseong: "ㅄ"))
    ///
    ///     let 리 = HangulKit.disassembleCompleteCharacter("리")
    ///     print(리) // prints Optional(DisassembledCharacter(choseong: "ㄹ", jungseong: "ㅣ"))
    ///
    ///     let a = HangulKit.disassembleCompleteCharacter("a")
    ///     print(a) // prints nil
    ///
    ///     let wow = HangulKit.disassembleCompleteCharacter("ㅘ")
    ///     print(wow) // also prints nil
    ///
    /// - Parameter letter:
    /// 분리하고자 하는 완전한 한글 문자
    ///
    /// - Returns:
    /// 입력된 문자의 초성, 중성, 종성을 프로퍼티로 갖는 옵셔널로 래핑된 ``HangulKit/DisassembledCharacter`` 구조체를 반환
    /// 입력된 문자가 완전한 한글 문자가 아닐 경우 nil을 반환
    ///
    static func disassembleCompleteCharacter(_ letter: Character) -> DisassembledCharacter? {
        guard isHangulCharacter(letter) else { return nil }
        
        let charCode = letter.unicodeScalars.first!.value
        
        let hangulCode = charCode - HangulKit.CompleteHangulStartUnicodeScalar
        
        let jongseongIndex = hangulCode % HangulKit.NumberOfJongseong
        let jungseongIndex = ((hangulCode - jongseongIndex) / HangulKit.NumberOfJongseong) % HangulKit.NumberOfJungseong
        let choseongIndex = (hangulCode - jongseongIndex) / HangulKit.NumberOfJongseong / HangulKit.NumberOfJungseong
        
        let result = DisassembledCharacter(choseong: HangulKit.Choseong.list[Int(choseongIndex)],
                      jungseong: HangulKit.Jungseong.list[Int(jungseongIndex)],
                      jongseong: HangulKit.Jongseong.list[Int(jongseongIndex)])
        
        return result
    }
}
