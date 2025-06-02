//
//  disassembleToGroupsTests.swift
//  HangulKit
//
//  Created by 김하민 on 3/25/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct disassembleToGroupsTests {
    
    @Test("Stirng -> [[Character]]")
    func disassembleToGroups1() {
        let input: [String] = ["값", "값이 비싸다", "사과 짱", "ㄵ", "ㅘ", "뷁"]
        let output: [[[Character]]] = [
            [
                ["ㄱ", "ㅏ", "ㅂ", "ㅅ"]
            ],
            [
                ["ㄱ", "ㅏ", "ㅂ", "ㅅ"],
                ["ㅇ", "ㅣ"],
                [" "],
                ["ㅂ", "ㅣ"],
                ["ㅆ", "ㅏ"],
                ["ㄷ", "ㅏ"],
            ],
            [
                ["ㅅ", "ㅏ"], ["ㄱ", "ㅗ", "ㅏ"], [" "], ["ㅉ", "ㅏ", "ㅇ"]
            ],
            [
                ["ㄴ", "ㅈ"]
            ],
            [
                ["ㅗ", "ㅏ"]
            ],
            [
                ["ㅂ", "ㅜ", "ㅔ", "ㄹ", "ㄱ"]
            ]
        ]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.disassembleToGroups(input) == output)
        }
    }
    
    @Test("Stirng -> [Character]")
    func disassembleToGroups2() {
        let input: [String] = ["값", "값이 비싸다", "사과 짱", "ㄵ", "ㅘ", "뷁"]
        let output: [[Character]] = [
            ["ㄱ", "ㅏ", "ㅂ", "ㅅ"],
            
            ["ㄱ", "ㅏ", "ㅂ", "ㅅ",
             "ㅇ", "ㅣ",
             " ",
             "ㅂ", "ㅣ",
             "ㅆ", "ㅏ",
             "ㄷ", "ㅏ"],
            
            ["ㅅ", "ㅏ", "ㄱ", "ㅗ", "ㅏ",
             " ",
             "ㅉ", "ㅏ", "ㅇ"],
            
            ["ㄴ", "ㅈ"],
            
            ["ㅗ", "ㅏ"],
            
            ["ㅂ", "ㅜ", "ㅔ", "ㄹ", "ㄱ"]
        ]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.disassembleToGroups(input) == output)
        }
    }
}

#endif
