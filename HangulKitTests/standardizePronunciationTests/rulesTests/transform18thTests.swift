//
//  transform18thTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

import Testing
@testable import HangulKit

struct transform18thTests {
    typealias Syllable = Hangul.Syllable
    
    @Test("제18항 - 받침 ㄱ(ㄲ, ㅋ, ㄳ, ㄺ)은 'ㄴ, ㅁ' 앞에서 [ㅇ, ㄴ, ㅁ]으로 발음한다.")
    func test1() {
        let current = try! Hangul.disassembleCompleteCharacter("먹")
        let next = try! Hangul.disassembleCompleteCharacter("는")
        
        let transformed = Syllable(choseong: "ㅁ",
                                   jungseong: "ㅓ",
                                   jongseong: "ㅇ")
        
        #expect(Hangul.transform18th(currentSyllable: current, nextSyllable: next) == transformed)
    }

    @Test("제18항 - 받침 ㄷ(ㅅ, ㅆ, ㅈ, ㅊ, ㅌ, ㅎ)은 'ㄴ, ㅁ' 앞에서 [ㅇ, ㄴ, ㅁ]으로 발음한다.")
    func test2() {
        let current = try! Hangul.disassembleCompleteCharacter("닫")
        let next = try! Hangul.disassembleCompleteCharacter("는")
        
        let transformed = Syllable(choseong: "ㄷ",
                                   jungseong: "ㅏ",
                                   jongseong: "ㄴ")
        
        #expect(Hangul.transform18th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
    @Test("제18항 - 받침 ㅂ(ㅍ, ㄼ, ㄿ, ㅄ)은 'ㄴ, ㅁ' 앞에서 [ㅇ, ㄴ, ㅁ]으로 발음한다.")
    func test3() {
        let current = try! Hangul.disassembleCompleteCharacter("잡")
        let next = try! Hangul.disassembleCompleteCharacter("는")
        
        let transformed = Syllable(choseong: "ㅈ",
                                   jungseong: "ㅏ",
                                   jongseong: "ㅁ")
        
        #expect(Hangul.transform18th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
}
