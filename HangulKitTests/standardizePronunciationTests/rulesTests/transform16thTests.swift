//
//  transform16thTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

import Testing
@testable import HangulKit

struct transform16thTests {
    typealias Syllable = Hangul.Syllable
    
    @Test("제16항 - 한글 자모의 이름은 그 받침소리를 연음하되, 'ㄷ, ㅈ, ㅊ, ㅋ, ㅌ, ㅍ, ㅎ'의 경우에는 특별히 다음과 같이 발음한다")
    func test1() {
        let current = try! Hangul.disassembleCompleteCharacter("귿")
        let next = try! Hangul.disassembleCompleteCharacter("이")
        let phrase = "디귿이"
        let index = 1
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㄱ", jungseong: "ㅡ"),
            Syllable(choseong: "ㅅ", jungseong: "ㅣ")
        )
        
        #expect(Hangul.transform16th(currentSyllable: current,
                                     nextSyllable: next,
                                     phrase: phrase, index: index) == transformed)
    }
    
    @Test("제14항 - 겹받침이 모음으로 시작된 조사나 어미, 접미사와 결합되는 경우에는, 뒤엣것만을 뒤 음절 첫소리로 옮겨 발음한다.")
    func test2() {
        let current = try! Hangul.disassembleCompleteCharacter("역")
        let next = try! Hangul.disassembleCompleteCharacter("이")
        let phrase = "기역이"
        let index = 1
        
        let transformed: (Syllable, Syllable) = (
            Syllable(choseong: "ㅇ", jungseong: "ㅕ"),
            Syllable(choseong: "ㄱ", jungseong: "ㅣ")
        )
        
        #expect(Hangul.transform16th(currentSyllable: current,
                                     nextSyllable: next,
                                     phrase: phrase, index: index) == transformed)
    }
    
}
