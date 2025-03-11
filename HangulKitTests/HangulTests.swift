//
//  HangulKitTests.swift
//  HangulKitTests
//
//  Created by 김하민 on 3/11/25.
//

import Testing
@testable import HangulKit

struct HangulTests {
    let hangul = Hangul()
    
    // isHangulSyllable은 완성된 한글 문자를 받으면 true를 반환한다.
    @Test func isHangulSyllable() async throws {
        #expect(hangul.isHangulSyllable("가") == true)
        #expect(hangul.isHangulSyllable("값") == true)
        #expect(hangul.isHangulSyllable("ㄱ") == false)
        #expect(hangul.isHangulSyllable("ㅏ") == false)
        #expect(hangul.isHangulSyllable("a") == false)
    }
    
    // isHangulAlphabet은 조합되지않은 한글 문자를 받으면 true를 반환한다.
    @Test func isHangulAlphabet() async throws {
        #expect(hangul.isHangulAlphabet("가") == false)
        #expect(hangul.isHangulAlphabet("값") == false)
        #expect(hangul.isHangulAlphabet("ㄱ") == true)
        #expect(hangul.isHangulAlphabet("ㅏ") == true)
        #expect(hangul.isHangulAlphabet("a") == false)
    }

}
