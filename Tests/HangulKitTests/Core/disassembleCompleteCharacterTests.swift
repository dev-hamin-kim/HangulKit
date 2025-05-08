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
            try HangulKit.disassembleCompleteCharacter("값") == HangulKit.DisassembledCharacter(choseong: "ㄱ",
                                                                                         jungseong: "ㅏ",
                                                                                         jongseong: "ㅄ")
        }
        
        #expect(throws: Never.self) {
            try HangulKit.disassembleCompleteCharacter("리") == HangulKit.DisassembledCharacter(choseong: "ㄹ",
                                                                                         jungseong: "ㅣ",
                                                                                         jongseong: nil)
        }
        
        #expect(throws: Never.self) {
            try HangulKit.disassembleCompleteCharacter("빚") == HangulKit.DisassembledCharacter(choseong: "ㅂ",
                                                                                         jungseong: "ㅣ",
                                                                                         jongseong: "ㅈ")
        }
        
        #expect(throws: Never.self) {
            try HangulKit.disassembleCompleteCharacter("박") == HangulKit.DisassembledCharacter(choseong: "ㅂ",
                                                                                         jungseong: "ㅏ",
                                                                                         jongseong: "ㄱ")
        }
    }
    
    @Test("완전한 한글 문자열이 아니면 에러를 반환해야 합니다.")
    func incompleteHangul() async throws {
        #expect(throws: HangulKit.InputError.notACompletedHangul) {
            try HangulKit.disassembleCompleteCharacter("ㅏ")
        }
        
        #expect(throws: HangulKit.InputError.notACompletedHangul) {
            try HangulKit.disassembleCompleteCharacter("ㅏ")
        }
    }
}
