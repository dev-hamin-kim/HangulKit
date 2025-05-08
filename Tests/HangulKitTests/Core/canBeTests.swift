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
        #expect(HangulKit.canBeChoseong("ㄱ") == true)
        #expect(HangulKit.canBeChoseong("ㅃ") == true)
        
        // 초성이 될 수 없다고 판단되는 경우
        #expect(HangulKit.canBeChoseong("ㅏ") == false)
        #expect(HangulKit.canBeChoseong("ㅘ") == false)
        #expect(HangulKit.canBeChoseong("ㄳ") == false)
        #expect(HangulKit.canBeChoseong("가") == false)
    }
    
    @Test func canBeJungseong() async throws {
        // 중성이 될 수 있다고 판단되는 경우
        #expect(HangulKit.canBeJungseong("ㅘ") == true)
        #expect(HangulKit.canBeJungseong("ㅏ") == true)
        
        // 중성이 될 수 없다고 판단되는 경우
        #expect(HangulKit.canBeJungseong("ㄱ") == false)
        #expect(HangulKit.canBeJungseong("ㄳ") == false)
        #expect(HangulKit.canBeJungseong("가") == false)
    }
    
    @Test func canBeJongseong() async throws {
        // 종성이 될 수 있다고 판단되는 경우
        #expect(HangulKit.canBeJongseong("ㄱ") == true)
        #expect(HangulKit.canBeJongseong("ㄳ") == true)
        #expect(HangulKit.canBeJongseong("ㅄ") == true)
        
        // 종성이 될 수 없다고 판단되는 경우
        #expect(HangulKit.canBeJongseong("ㅃ") == false)
        #expect(HangulKit.canBeJongseong("ㅘ") == false)
        #expect(HangulKit.canBeJongseong("ㅏ") == false)
        #expect(HangulKit.canBeJongseong("ㅏ") == false)
    }
}
