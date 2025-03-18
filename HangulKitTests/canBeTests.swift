//
//  canBeTests.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

import Testing
@testable import HangulKit

struct canBeTests {
    
    @Test func canBeChoseong() async throws {
        #expect(Hangul.canBeChoseong("ㄱ") == true)
        #expect(Hangul.canBeChoseong("ㅃ") == true)
        #expect(Hangul.canBeChoseong("ㄳ") == false)
        #expect(Hangul.canBeChoseong("ㅏ") == false)
        #expect(Hangul.canBeChoseong("가") == false)
    }
    
    @Test func canBeJungseong() async throws {
        #expect(Hangul.canBeJungseong("ㅏ") == true)
        #expect(Hangul.canBeJungseong("ㅘ") == true)
//        #expect(Hangul.canBeJungseong("ㅏㅗ") == false)
        #expect(Hangul.canBeJungseong("ㄱ") == false)
        #expect(Hangul.canBeJungseong("ㄳ") == false)
        #expect(Hangul.canBeJungseong("가") == false)
    }
    
    @Test func canBeJongseong() async throws {
        #expect(Hangul.canBeJongseong("ㄱ") == true)
        #expect(Hangul.canBeJongseong("ㄳ") == true)
//        #expect(Hangul.canBeJongseong("ㅎㄹ") == false)
        #expect(Hangul.canBeJongseong("가") == false)
        #expect(Hangul.canBeJongseong("ㅏ") == false)
        #expect(Hangul.canBeJongseong("ㅘ") == false)
    }
}
