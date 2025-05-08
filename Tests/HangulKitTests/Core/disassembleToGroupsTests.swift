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
        #expect(HangulKit.disassembleToGroups("값") == [["ㄱ", "ㅏ", "ㅂ", "ㅅ"]])
        #expect(HangulKit.disassembleToGroups("값이 비싸다") ==
                [
                    ["ㄱ", "ㅏ", "ㅂ", "ㅅ"],
                    ["ㅇ", "ㅣ"],
                    [" "],
                    ["ㅂ", "ㅣ"],
                    ["ㅆ", "ㅏ"],
                    ["ㄷ", "ㅏ"],
                ]
        )
        #expect(HangulKit.disassembleToGroups("사과 짱") == [["ㅅ", "ㅏ"], ["ㄱ", "ㅗ", "ㅏ"], [" "], ["ㅉ", "ㅏ", "ㅇ"]])
        #expect(HangulKit.disassembleToGroups("ㄵ") == [["ㄴ", "ㅈ"]])
        #expect(HangulKit.disassembleToGroups("ㅘ") == [["ㅗ", "ㅏ"]])
        
        #expect(HangulKit.disassembleToGroups("뷁") == [["ㅂ", "ㅜ", "ㅔ", "ㄹ", "ㄱ"]])
    }
}
