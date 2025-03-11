//
//  HangulKitTests.swift
//  HangulKitTests
//
//  Created by 김하민 on 3/11/25.
//

import Testing
@testable import HangulKit

struct HangulKitTests {

    @Test func isHangulSyllable() async throws {
        let hangul = Hangul()
                
        #expect(hangul.isHangulSyllable("가") == true)
        #expect(hangul.isHangulSyllable("값") == true)
        #expect(hangul.isHangulSyllable("ㄱ") == false)
        #expect(hangul.isHangulSyllable("ㅏ") == false)
        #expect(hangul.isHangulSyllable("a") == false)
    }

}
