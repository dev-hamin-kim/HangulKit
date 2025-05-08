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
        #expect(HangulKit.hasBatchim("값") == true)
        #expect(HangulKit.hasBatchim("토") == false)
        #expect(HangulKit.hasBatchim("갑", .single) == true)
        #expect(HangulKit.hasBatchim("값", .single) == false)
        #expect(HangulKit.hasBatchim("값", .double) == true)
        #expect(HangulKit.hasBatchim("토", .double) == false)
    }
}
