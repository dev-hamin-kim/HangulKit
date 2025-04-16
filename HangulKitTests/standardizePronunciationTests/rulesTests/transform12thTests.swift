//
//  transform12thTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/16/25.
//

import Testing
@testable import HangulKit

struct transform12thTests {
    
    typealias Syllable = Hangul.Syllable
    
    @Test("'ㅎ, ㄶ, ㅀ' 뒤에 'ㄱ, ㄷ, ㅈ'이 결합되는 경우에는, 뒤 음절 첫소리와 합쳐서 'ㅋ, ㅌ, ㅊ'으로 발음한다")
    func test1() {
        let current = try! Hangul.disassembleCompleteCharacter("놓")
        let next = try! Hangul.disassembleCompleteCharacter("고")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄴ", jungseong: "ㅗ"),
            Syllable(choseong: "ㅋ", jungseong: "ㅗ")
        )
        
        #expect(Hangul.transform12th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
    @Test("받침 'ㄱ, ㄺ, ㄷ, ㅂ, ㄼ, ㅈ, ㄵ'이 뒤 음절 첫소리 'ㅎ'과 결합되는 경우에도, 역시 두 음을 합쳐서 'ㅋ, ㅌ, ㅍ, ㅊ'으로 발음한다")
    func test2() {
        let current = try! Hangul.disassembleCompleteCharacter("각")
        let next = try! Hangul.disassembleCompleteCharacter("하")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄱ", jungseong: "ㅏ"),
            Syllable(choseong: "ㅋ", jungseong: "ㅏ")
        )
        
        #expect(Hangul.transform12th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
    @Test("'ㅎ, ㄶ, ㅀ' 뒤에 'ㅅ'이 결합되는 경우에는, 'ㅅ'을 'ㅆ'으로 발음한다")
    func test3() {
        let current = try! Hangul.disassembleCompleteCharacter("닿")
        let next = try! Hangul.disassembleCompleteCharacter("소")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄷ", jungseong: "ㅏ"),
            Syllable(choseong: "ㅆ", jungseong: "ㅗ")
        )
        
        #expect(Hangul.transform12th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
    @Test("'ㅎ' 뒤에 'ㄴ'이 결합되는 경우에는 'ㄴ'으로 발음한다")
    func test4() {
        let current = try! Hangul.disassembleCompleteCharacter("놓")
        let next = try! Hangul.disassembleCompleteCharacter("는")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄴ", jungseong: "ㅗ"),
            Syllable(choseong: "ㄴ", jungseong: "ㅡ", jongseong: "ㄴ")
        )
        
        #expect(Hangul.transform12th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
    @Test("'ㄶ, ㅀ' 뒤에 'ㄴ'이 결합되는 경우에는, 'ㅎ'을 발음하지 않는다")
    func test5() {
        let current = try! Hangul.disassembleCompleteCharacter("않")
        let next = try! Hangul.disassembleCompleteCharacter("네")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㅇ", jungseong: "ㅏ", jongseong: "ㄴ"),
            Syllable(choseong: "ㄴ", jungseong: "ㅔ")
        )
        
        #expect(Hangul.transform12th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
    @Test("'ㅎ, ㄶ, ㅀ' 뒤에 모음으로 시작된 어미나 접미사가 결합되는 경우에는 'ㅎ'을 발음하지 않는다")
    func test6() {
        let current = try! Hangul.disassembleCompleteCharacter("낳")
        let next = try! Hangul.disassembleCompleteCharacter("은")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄴ", jungseong: "ㅏ"),
            Syllable(choseong: "ㅇ", jungseong: "ㅡ", jongseong: "ㄴ")
        )
        
        #expect(Hangul.transform12th(currentSyllable: current, nextSyllable: next) == transformed)
    }

    @Test("'ㅎ, ㄶ, ㅀ' 뒤에 모음으로 시작된 어미나 접미사가 결합되는 경우에는 'ㅎ'을 발음하지 않는다")
    func test7() {
        let current = try! Hangul.disassembleCompleteCharacter("많")
        let next: Syllable? = nil
        
        let transformed: (Syllable, Syllable?) = (
            Syllable(choseong: "ㅁ", jungseong: "ㅏ", jongseong: "ㄴ"),
            nil
        )
        
        #expect(Hangul.transform12th(currentSyllable: current, nextSyllable: next) == transformed)
    }
}
