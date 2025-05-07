//
//  hasBatchimTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/3/25.
//

import Testing
@testable import HangulKit

struct hasBatchimTests {
    
    @Test
    func example() {
        #expect(Hangul.hasBatchim("값") == true)
        #expect(Hangul.hasBatchim("토") == false)
        #expect(Hangul.hasBatchim("갑", .single) == true)
        #expect(Hangul.hasBatchim("값", .single) == false)
        #expect(Hangul.hasBatchim("값", .double) == true)
        #expect(Hangul.hasBatchim("토", .double) == false)
    }
}
