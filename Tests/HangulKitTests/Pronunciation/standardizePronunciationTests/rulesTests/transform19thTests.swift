//
//  transform19thTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

import Testing
@testable import HangulKit

struct transform19thTests {
    typealias Syllable = HangulKit.Syllable
    
    @Test("받침 'ㅁ, ㅇ' 뒤에 연결되는 'ㄹ'은 'ㄴ'으로 발음한다")
    func test1() {
        let current = HangulKit.disassembleCompleteCharacter("담")!
        let next = HangulKit.disassembleCompleteCharacter("력")!
        
        let transformed = Syllable(choseong: "ㄴ",
                                   jungseong: "ㅕ",
                                   jongseong: "ㄱ")
        
        #expect(HangulKit.transform19th(currentSyllable: current, nextSyllable: next) == transformed)
    }

    @Test("받침 ㄷ(ㅅ, ㅆ, ㅈ, ㅊ, ㅌ, ㅎ)은 'ㄴ, ㅁ' 앞에서 [ㅇ, ㄴ, ㅁ]으로 발음한다.")
    func test2() {
        let current = HangulKit.disassembleCompleteCharacter("막")!
        let next = HangulKit.disassembleCompleteCharacter("론")!
        
        let transformed = Syllable(choseong: "ㄴ",
                                   jungseong: "ㅗ",
                                   jongseong: "ㄴ")
        
        #expect(HangulKit.transform19th(currentSyllable: current, nextSyllable: next) == transformed)
    }

}
