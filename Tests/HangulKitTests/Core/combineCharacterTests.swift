//
//  combineTests.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

import Testing
@testable import HangulKit

struct combineCharacterTests {
    
    @Test func combineCharacterTest() async throws {
        // 종성으로 겹받침으로 구성될 수 있는 문자 두 개를 받으면 겹받침을 생성한다. (ㄱ, ㅏ, ㅂㅅ)
        #expect(throws: Never.self) {
            try Hangul.combineCharacter(choseong: "ㄱ", jungseong: "ㅏ", jongseong: "ㅄ") == "값"
        }
        
        // 종성이 입력되지 않았다면 받침이 없는 문자로 합성한다. (ㅌ, ㅗ)
        #expect(throws: Never.self) {
            try Hangul.combineCharacter(choseong: "ㅌ", jungseong: "ㅗ") == "토"
        }
        
        // 종성이 입력되었다면 받침을 추가한다. (ㅌ, ㅗ, ㅅ)
        #expect(throws: Never.self) {
            try Hangul.combineCharacter(choseong: "ㅌ", jungseong: "ㅗ", jongseong: "ㅅ") == "톳"
        }
        
        // 초성이 될 수 없는 문자가 초성으로 입력되면 invalidChoseong 에러를 반환한다. (ㅏ, ㅏ, ㄱ)
        #expect(throws: Hangul.CombineCharacterError.invalidChoseong) {
            try Hangul.combineCharacter(choseong: "ㅏ", jungseong: "ㅏ", jongseong: "ㄱ")
        }
        
        // 중성이 될 수 없는 문자가 중성으로 입력되면 에러를 반환한다. (ㄱ, ㄴ, ㅃ)
        #expect(throws: Hangul.CombineCharacterError.invalidJungseong) {
            try Hangul.combineCharacter(choseong: "ㄱ", jungseong: "ㄴ", jongseong: "ㅃ")
        }
        
        // 종성이 될 수 없는 문자가 종성으로 입력되면 에러를 반환한다. (ㄱ, ㅏ, ㅃ)
        #expect(throws: Hangul.CombineCharacterError.invalidJongseong) {
            try Hangul.combineCharacter(choseong: "ㄱ", jungseong: "ㅏ", jongseong: "ㅃ")
        }
        
        // 온전한 한글 문자가 하나라도 입력되면 에러를 반환한다. (가, ㅏ, ㄱ)
        #expect(throws: Hangul.CombineCharacterError.invalidChoseong) {
            try Hangul.combineCharacter(choseong: "가", jungseong: "ㅏ", jongseong: "ㄱ")
        }
    }
}
