//
//  transform17thTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

import Testing
@testable import HangulKit

struct transform17thTests {
    typealias Syllable = HangulKit.Syllable
    
    @Test("받침 'ㄷ', 'ㅌ(ㄾ)'이 조사나 접미사의 모음 'ㅣ'와 결합되는 경우에는, 'ㅈ', 'ㅊ'으로 바꾸어서 뒤 음절 첫소리로 옮겨 발음한다")
    func test1() {
        let current = HangulKit.disassembleCompleteCharacter("굳")!
        let next = HangulKit.disassembleCompleteCharacter("이")!
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄱ", jungseong: "ㅜ"),
            Syllable(choseong: "ㅈ", jungseong: "ㅣ")
        )
        
        #expect(HangulKit.transform17th(currentSyllable: current, nextSyllable: next) == transformed)
    }

    @Test("'ㄷ' 뒤에 접미사 '히'가 결합되어 '티'를 이루는 것은 '치'로 발음한다")
    func test2() {
        let current = HangulKit.disassembleCompleteCharacter("굳")!
        let next = HangulKit.disassembleCompleteCharacter("히")!
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄱ", jungseong: "ㅜ"),
            Syllable(choseong: "ㅊ", jungseong: "ㅣ")
        )
        
        #expect(HangulKit.transform17th(currentSyllable: current, nextSyllable: next) == transformed)
    }
}
