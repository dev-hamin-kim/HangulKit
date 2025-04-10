//
//  HangulKitTests.swift
//  HangulKitTests
//
//  Created by 김하민 on 3/11/25.
//

import Testing
@testable import HangulKit

struct HangulKitTests {

    // isHangulSyllable은 완성된 한글 문자를 받으면 true를 반환한다.
    @Test func isHangulSyllable() async throws {
        #expect("가".hangul.isHangulSyllable() == true)
        #expect("값".hangul.isHangulSyllable() == true)
        #expect("ㄱ".hangul.isHangulSyllable() == false)
        #expect("ㅏ".hangul.isHangulSyllable() == false)
        #expect("a".hangul.isHangulSyllable() == false)
    }
    
    // isHangulAlphabet은 조합되지않은 한글 문자를 받으면 true를 반환한다.
    @Test func isHangulAlphabet() async throws {
        #expect("가".hangul.isHangulAlphabet() == false)
        #expect("값".hangul.isHangulAlphabet() == false)
        #expect("ㄱ".hangul.isHangulAlphabet() == true)
        #expect("ㅏ".hangul.isHangulAlphabet() == true)
        #expect("a".hangul.isHangulAlphabet() == false)
    }
    
    // isHangul은 한글 문자열을 받으면 true를 반환한다.
    @Test func isHangul() async throws {
        #expect("값".hangul.isHangul() == true)
        #expect("ㄱ".hangul.isHangul() == true)
        #expect("ㅏ".hangul.isHangul() == true)
        #expect("저는 고양이를 좋아합니다".hangul.isHangul() == true)
        #expect("a a".hangul.isHangul() == false)
    }

}
