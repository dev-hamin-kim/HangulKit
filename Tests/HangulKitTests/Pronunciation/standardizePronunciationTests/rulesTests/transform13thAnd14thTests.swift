//
//  transform13thAnd14thTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/17/25.
//

import Testing
@testable import HangulKit

struct transform13thTests {
    typealias Syllable = HangulKit.Syllable
    
    @Test("홑받침이나 쌍받침이 모음으로 시작된 조사나 어미, 접미사와 결합되는 경우에는, 제 음가대로 뒤 음절 첫소리로 옮겨 발음한다")
    func test() {
        let current = try! HangulKit.disassembleCompleteCharacter("깎")
        let next = try! HangulKit.disassembleCompleteCharacter("아")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄲ", jungseong: "ㅏ"),
            Syllable(choseong: "ㄲ", jungseong: "ㅏ")
        )
        
        #expect(HangulKit.transform13And14th(currentSyllable: current, nextSyllable: next) == transformed)
    }
}

struct transform14thTests {
    typealias Syllable = HangulKit.Syllable
    
    @Test("겹받침이 모음으로 시작된 조사나 어미, 접미사와 결합되는 경우에는, 뒤엣것만을 뒤 음절 첫소리로 옮겨 발음한다.")
    func test() {
        let current = try! HangulKit.disassembleCompleteCharacter("닭")
        let next = try! HangulKit.disassembleCompleteCharacter("을")
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄷ", jungseong: "ㅏ", jongseong: "ㄹ"),
            Syllable(choseong: "ㄱ", jungseong: "ㅡ", jongseong: "ㄹ")
        )
        
        #expect(HangulKit.transform13And14th(currentSyllable: current, nextSyllable: next) == transformed)
    }
    
}
