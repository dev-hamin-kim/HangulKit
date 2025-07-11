//
//  transform20thTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct transform20thTests {
    typealias Syllable = HangulKit.Syllable
    
    @Test("'ㄴ'은 'ㄹ'의 앞이나 뒤에서 'ㄹ'로 발음한다")
    func test1() {
        let current = HangulKit.disassembleCompleteCharacter("난")!
        let next = HangulKit.disassembleCompleteCharacter("로")!
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄴ", jungseong: "ㅏ", jongseong: "ㄹ"),
            Syllable(choseong: "ㄹ", jungseong: "ㅗ")
        )
        
        #expect(HangulKit.transform20th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
    @Test("첫소리 'ㄴ'이 'ㅀ, ㄾ' 뒤에 연결되는 경우에도 'ㄹ'로 발음한다")
    func test2() {
        let current = HangulKit.disassembleCompleteCharacter("닳")!
        let next = HangulKit.disassembleCompleteCharacter("는")!
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄷ", jungseong: "ㅏ", jongseong: "ㅀ"),
            Syllable(choseong: "ㄹ", jungseong: "ㅡ", jongseong: "ㄴ")
        )
        
        #expect(HangulKit.transform20th(currentSyllable: current, nextSyllable: next) == transformed)
    }
}

#endif
