//
//  disassembleTests.swift
//  HangulKit
//
//  Created by 김하민 on 3/28/25.
//

import Testing
@testable import HangulKit

struct disassembleTests {
    
    @Test
    func disassemble() {
        #expect(Hangul.disassemble("값") == "ㄱㅏㅂㅅ")
        #expect(Hangul.disassemble("값이 비싸다") == "ㄱㅏㅂㅅㅇㅣ ㅂㅣㅆㅏㄷㅏ")
        #expect(Hangul.disassemble("사과 짱") == "ㅅㅏㄱㅗㅏ ㅉㅏㅇ")
        #expect(Hangul.disassemble("ㄵ") == "ㄴㅈ")
        #expect(Hangul.disassemble("ㅘ") == "ㅗㅏ")
    }
}
