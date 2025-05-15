//
//  transformHardConversionTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

import Testing
@testable import HangulKit

struct transformHardConversionTests {
    typealias Syllable = HangulKit.Syllable
    
    @Test("받침 'ㄱ(ㄲ, ㅋ, ㄳ, ㄺ), ㄷ(ㅅ, ㅆ, ㅈ, ㅊ, ㅌ), ㅂ(ㅍ, ㄼ, ㄿ, ㅄ)' 뒤에 연결되는 'ㄱ, ㄷ, ㅂ, ㅅ, ㅈ'은 된소리로 발음한다")
    func rule23() {
        let current = HangulKit.disassembleCompleteCharacter("국")!
        let next = HangulKit.disassembleCompleteCharacter("밥")!
        
        let transformed = Syllable(choseong: "ㅃ",
                                   jungseong: "ㅏ",
                                   jongseong: "ㅂ")
        
        #expect(HangulKit.transformHardConversion(currentSyllable: current, nextSyllable: next) == transformed)
    }

    @Test("어간 받침 'ㄴ(ㄵ), ㅁ(ㄻ)' 뒤에 결합되는 어미의 첫소리 'ㄱ, ㄷ, ㅅ, ㅈ'은 된소리로 발음한다")
    func rule24() {
        let current = HangulKit.disassembleCompleteCharacter("신")!
        let next = HangulKit.disassembleCompleteCharacter("고")!
        
        let transformed = Syllable(choseong: "ㄲ",
                                   jungseong: "ㅗ")
        
        #expect(HangulKit.transformHardConversion(currentSyllable: current, nextSyllable: next) == transformed)
    }

    @Test("어간 받침 'ㄼ, ㄾ' 뒤에 결합되는 어미의 첫소리 'ㄱ, ㄷ, ㅅ, ㅈ'은 된소리로 발음한다")
    func rule25() {
        let current = HangulKit.disassembleCompleteCharacter("넓")!
        let next = HangulKit.disassembleCompleteCharacter("게")!
        
        let transformed = Syllable(choseong: "ㄲ",
                                   jungseong: "ㅔ")
        
        #expect(HangulKit.transformHardConversion(currentSyllable: current, nextSyllable: next) == transformed)
    }
}

