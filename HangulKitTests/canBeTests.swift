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
        // 초성이 될 수 있다고 판단되는 경우
        #expect(Hangul.canBeChoseong("ㄱ") == true)
        #expect(Hangul.canBeChoseong("ㅃ") == true)
        
        // 초성이 될 수 없다고 판단되는 경우
        #expect(Hangul.canBeChoseong("ㅏ") == false)
        #expect(Hangul.canBeChoseong("ㅘ") == false)
        #expect(Hangul.canBeChoseong("ㄳ") == false)
        #expect(Hangul.canBeChoseong("가") == false)
    }
    
    @Test func canBeJungseong() async throws {
        // 중성이 될 수 있다고 판단되는 경우
        #expect(Hangul.canBeJungseong("ㅘ") == true)
        #expect(Hangul.canBeJungseong("ㅏ") == true)
        
        // 중성이 될 수 없다고 판단되는 경우
        #expect(Hangul.canBeJungseong("ㄱ") == false)
        #expect(Hangul.canBeJungseong("ㄳ") == false)
        #expect(Hangul.canBeJungseong("가") == false)
    }
    
    @Test func canBeJongseong() async throws {
        // 종성이 될 수 있다고 판단되는 경우
        #expect(Hangul.canBeJongseong("ㄱ") == true)
        #expect(Hangul.canBeJongseong("ㄳ") == true)
        #expect(Hangul.canBeJongseong("ㅄ") == true)
        
        // 종성이 될 수 없다고 판단되는 경우
        #expect(Hangul.canBeJongseong("ㅃ") == false)
        #expect(Hangul.canBeJongseong("ㅘ") == false)
        #expect(Hangul.canBeJongseong("ㅏ") == false)
        #expect(Hangul.canBeJongseong("ㅏ") == false)
    }
}
