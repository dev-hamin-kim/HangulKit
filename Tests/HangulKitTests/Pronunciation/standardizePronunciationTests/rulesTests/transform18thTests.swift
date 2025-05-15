//
//  transform18thTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

import Testing
@testable import HangulKit

struct transform18thTests {
    typealias Syllable = HangulKit.Syllable
    
    @Test("받침 ㄱ(ㄲ, ㅋ, ㄳ, ㄺ)은 'ㄴ, ㅁ' 앞에서 [ㅇ, ㄴ, ㅁ]으로 발음한다.")
    func test1() {
        let current = HangulKit.disassembleCompleteCharacter("먹")!
        let next = HangulKit.disassembleCompleteCharacter("는")!
        
        let transformed = Syllable(choseong: "ㅁ",
                                   jungseong: "ㅓ",
                                   jongseong: "ㅇ")
        
        #expect(HangulKit.transform18th(currentSyllable: current, nextSyllable: next) == transformed)
    }

    @Test("받침 ㄷ(ㅅ, ㅆ, ㅈ, ㅊ, ㅌ, ㅎ)은 'ㄴ, ㅁ' 앞에서 [ㅇ, ㄴ, ㅁ]으로 발음한다.")
    func test2() {
        let current = HangulKit.disassembleCompleteCharacter("닫")!
        let next = HangulKit.disassembleCompleteCharacter("는")!
        
        let transformed = Syllable(choseong: "ㄷ",
                                   jungseong: "ㅏ",
                                   jongseong: "ㄴ")
        
        #expect(HangulKit.transform18th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
    @Test("받침 ㅂ(ㅍ, ㄼ, ㄿ, ㅄ)은 'ㄴ, ㅁ' 앞에서 [ㅇ, ㄴ, ㅁ]으로 발음한다.")
    func test3() {
        let current = HangulKit.disassembleCompleteCharacter("잡")!
        let next = HangulKit.disassembleCompleteCharacter("는")!
        
        let transformed = Syllable(choseong: "ㅈ",
                                   jungseong: "ㅏ",
                                   jongseong: "ㅁ")
        
        #expect(HangulKit.transform18th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
}
