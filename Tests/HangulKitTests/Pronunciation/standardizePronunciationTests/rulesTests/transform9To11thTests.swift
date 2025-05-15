//
//  transform9To11thTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

import Testing
@testable import HangulKit

struct transform9thTests {
    typealias Syllable = HangulKit.Syllable
    
    @Test("받침 'ㄲ, ㅋ' / 'ㅅ, ㅆ, ㅈ, ㅊ, ㅌ' / 'ㅍ'은 어말 또는 자음 앞에서 각각 대표음 'ㄱ, ㄷ, ㅂ'으로 발음한다.")
    func test1() {
        let current = HangulKit.disassembleCompleteCharacter("닭")!
        let next = HangulKit.disassembleCompleteCharacter("다")!
        
        let transformed = Syllable(choseong: "ㄷ",
                                   jungseong: "ㅏ",
                                   jongseong: "ㄱ")
        
        #expect(HangulKit.transform9To11th(currentSyllable: current, nextSyllable: next) == transformed)
    }
}

struct transform10thTests {
    typealias Syllable = HangulKit.Syllable
    
    @Test("겹받침 'ㄳ' / 'ㄵ' / 'ㄼ, ㄽ, ㄾ' / 'ㅄ'은 어말 또는 자음 앞에서 각각 'ㄱ, ㄴ, ㄹ, ㅂ'으로 발음한다.")
    func test1() {
        let current = HangulKit.disassembleCompleteCharacter("앉")!
        let next = HangulKit.disassembleCompleteCharacter("다")!
        
        let transformed = Syllable(choseong: "ㅇ",
                                   jungseong: "ㅏ",
                                   jongseong: "ㄴ")
        
        #expect(HangulKit.transform9To11th(currentSyllable: current, nextSyllable: next) == transformed)
    }
}

struct transform11thTests {
    typealias Syllable = HangulKit.Syllable
    
    @Test("겹받침 'ㄺ' / 'ㄻ' / 'ㄿ'은 어말 또는 자음 앞에서 각각 'ㄱ, ㅁ, ㅂ'으로 발음한다.")
    func test1() {
        let current = HangulKit.disassembleCompleteCharacter("흙")!
        let next = HangulKit.disassembleCompleteCharacter("과")!
        
        let transformed = Syllable(choseong: "ㅎ",
                                   jungseong: "ㅡ",
                                   jongseong: "ㄱ")
        
        #expect(HangulKit.transform9To11th(currentSyllable: current, nextSyllable: next) == transformed)
    }
}
