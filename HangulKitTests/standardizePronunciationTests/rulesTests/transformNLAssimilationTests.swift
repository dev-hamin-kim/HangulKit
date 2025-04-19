//
//  transformNLAssimilationTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

import Testing
@testable import HangulKit

struct transformNLAssimilationTests {
    typealias Syllable = Hangul.Syllable
    
    @Test("받침이 'ㄱ, ㄴ, ㄷ, ㅁ, ㅂ, ㅇ'이고 다음 음절이 '야, 여, 요, 유, 이, 얘, 예'로 이어지는 경우")
    func test1() {
        let current = try! Hangul.disassembleCompleteCharacter("맨")
        let next = try! Hangul.disassembleCompleteCharacter("입")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㅁ", jungseong: "ㅐ", jongseong: "ㄴ"),
            Syllable(choseong: "ㄴ", jungseong: "ㅣ", jongseong: "ㅂ")
        )
        
        #expect(Hangul.transformNLAssimilation(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
    @Test("받침이 'ㄹ'이고 다음 음절이 '야, 여, 요, 유, 이, 얘, 예'로 이어지는 경우")
    func test2() {
        let current = try! Hangul.disassembleCompleteCharacter("알")
        let next = try! Hangul.disassembleCompleteCharacter("약")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㅇ", jungseong: "ㅏ", jongseong: "ㄹ"),
            Syllable(choseong: "ㄹ", jungseong: "ㅑ", jongseong: "ㄱ")
        )
        
        #expect(Hangul.transformNLAssimilation(currentSyllable: current, nextSyllable: next) == transformed)
    }

    @Test("ㄴ/ㄹ이 되기 위한 조건이지만 현재 음절의 중성의 ∙(아래아)가 하나가 아닐 경우에는 덧나지 않고 연음규칙이 적용된다")
    func test3() {
        let current = try! Hangul.disassembleCompleteCharacter("양")
        let next = try! Hangul.disassembleCompleteCharacter("이")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㅇ", jungseong: "ㅑ", jongseong: "ㅇ"),
            Syllable(choseong: "ㅇ", jungseong: "ㅣ")
        )
        
        #expect(Hangul.transformNLAssimilation(currentSyllable: current, nextSyllable: next) == transformed)
    }

}
