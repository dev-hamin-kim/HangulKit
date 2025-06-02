//
//  disassembleTests.swift
//  HangulKit
//
//  Created by 김하민 on 3/28/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct disassembleTests {
    
    @Test
    func disassemble() {
        #expect(HangulKit.disassemble("값") == "ㄱㅏㅂㅅ")
        #expect(HangulKit.disassemble("값이 비싸다") == "ㄱㅏㅂㅅㅇㅣ ㅂㅣㅆㅏㄷㅏ")
        #expect(HangulKit.disassemble("사과 짱") == "ㅅㅏㄱㅗㅏ ㅉㅏㅇ")
        #expect(HangulKit.disassemble("ㄵ") == "ㄴㅈ")
        #expect(HangulKit.disassemble("ㅘ") == "ㅗㅏ")
    }
}

#endif
