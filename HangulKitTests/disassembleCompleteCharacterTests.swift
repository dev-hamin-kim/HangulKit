//
//  disassembleCompleteCharacterTests.swift
//  HangulKit
//
//  Created by 김하민 on 3/25/25.
//

import Testing
@testable import HangulKit

struct disassembleCompleteCharacterTests {
    
    @Test("온전한 한글 한 글자")
    func completeHangul() {
        #expect(throws: Never.self) {
            try Hangul.disassembleCompleteCharacter("값") == (choseong: "ㄱ",
                                                             jungseong: "ㅏ",
                                                             jongseong: "ㅂㅅ")
        }
        
        #expect(throws: Never.self) {
            try Hangul.disassembleCompleteCharacter("리") == (choseong: "ㄹ",
                                                             jungseong: "ㅣ",
                                                             jongseong: "")
        }
        
        #expect(throws: Never.self) {
            try Hangul.disassembleCompleteCharacter("빚") == (choseong: "ㅂ",
                                                             jungseong: "ㅣ",
                                                             jongseong: "ㅈ")
        }
        
        #expect(throws: Never.self) {
            try Hangul.disassembleCompleteCharacter("박") == (choseong: "ㅂ",
                                                             jungseong: "ㅏ",
                                                             jongseong: "ㄱ")
        }
    }
    
    @Test("완전한 한글 문자열이 아니면 에러를 반환해야 합니다.")
    func incompleteHangul() async throws {
        #expect(throws: Hangul.InputError.notACompletedHangul) {
            try Hangul.disassembleCompleteCharacter("ㅏ")
        }
        
        #expect(throws: Hangul.InputError.notACompletedHangul) {
            try Hangul.disassembleCompleteCharacter("ㅏ")
        }
    }
}
