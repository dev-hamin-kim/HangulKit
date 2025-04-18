//
//  transformHardConversionTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

import Testing
@testable import HangulKit

struct transformHardConversionTests {
    typealias Syllable = Hangul.Syllable
    
    @Test("받침 'ㄱ(ㄲ, ㅋ, ㄳ, ㄺ), ㄷ(ㅅ, ㅆ, ㅈ, ㅊ, ㅌ), ㅂ(ㅍ, ㄼ, ㄿ, ㅄ)' 뒤에 연결되는 'ㄱ, ㄷ, ㅂ, ㅅ, ㅈ'은 된소리로 발음한다")
    func rule23() {
        let current = try! Hangul.disassembleCompleteCharacter("국")
        let next = try! Hangul.disassembleCompleteCharacter("밥")
        
        let transformed = Syllable(choseong: "ㅃ",
                                   jungseong: "ㅏ",
                                   jongseong: "ㅂ")
        
        #expect(Hangul.transformHardConversion(currentSyllable: current, nextSyllable: next) == transformed)
    }

    @Test("어간 받침 'ㄴ(ㄵ), ㅁ(ㄻ)' 뒤에 결합되는 어미의 첫소리 'ㄱ, ㄷ, ㅅ, ㅈ'은 된소리로 발음한다")
    func rule24() {
        let current = try! Hangul.disassembleCompleteCharacter("신")
        let next = try! Hangul.disassembleCompleteCharacter("고")
        
        let transformed = Syllable(choseong: "ㄲ",
                                   jungseong: "ㅗ")
        
        #expect(Hangul.transformHardConversion(currentSyllable: current, nextSyllable: next) == transformed)
    }

    @Test("어간 받침 'ㄼ, ㄾ' 뒤에 결합되는 어미의 첫소리 'ㄱ, ㄷ, ㅅ, ㅈ'은 된소리로 발음한다")
    func rule25() {
        let current = try! Hangul.disassembleCompleteCharacter("넓")
        let next = try! Hangul.disassembleCompleteCharacter("게")
        
        let transformed = Syllable(choseong: "ㄲ",
                                   jungseong: "ㅔ")
        
        #expect(Hangul.transformHardConversion(currentSyllable: current, nextSyllable: next) == transformed)
    }
}

