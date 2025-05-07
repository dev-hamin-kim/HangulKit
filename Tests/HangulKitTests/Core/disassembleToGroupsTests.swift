//
//  disassembleToGroupsTests.swift
//  HangulKit
//
//  Created by 김하민 on 3/25/25.
//

import Testing
@testable import HangulKit

struct disassembleToGroupsTests {
    
    @Test
    func disassembleToGroups() {
        #expect(Hangul.disassembleToGroups("값") == [["ㄱ", "ㅏ", "ㅂ", "ㅅ"]])
        #expect(Hangul.disassembleToGroups("값이 비싸다") ==
                [
                    ["ㄱ", "ㅏ", "ㅂ", "ㅅ"],
                    ["ㅇ", "ㅣ"],
                    [" "],
                    ["ㅂ", "ㅣ"],
                    ["ㅆ", "ㅏ"],
                    ["ㄷ", "ㅏ"],
                ]
        )
        #expect(Hangul.disassembleToGroups("사과 짱") == [["ㅅ", "ㅏ"], ["ㄱ", "ㅗ", "ㅏ"], [" "], ["ㅉ", "ㅏ", "ㅇ"]])
        #expect(Hangul.disassembleToGroups("ㄵ") == [["ㄴ", "ㅈ"]])
        #expect(Hangul.disassembleToGroups("ㅘ") == [["ㅗ", "ㅏ"]])
        
        #expect(Hangul.disassembleToGroups("뷁") == [["ㅂ", "ㅜ", "ㅔ", "ㄹ", "ㄱ"]])
    }
}
