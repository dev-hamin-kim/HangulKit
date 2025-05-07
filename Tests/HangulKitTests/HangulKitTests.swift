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
        #expect("가".hk.isHangulSyllable() == true)
        #expect("값".hk.isHangulSyllable() == true)
        #expect("ㄱ".hk.isHangulSyllable() == false)
        #expect("ㅏ".hk.isHangulSyllable() == false)
        #expect("a".hk.isHangulSyllable() == false)
    }
    
    // isHangulAlphabet은 조합되지않은 한글 문자를 받으면 true를 반환한다.
    @Test func isHangulAlphabet() async throws {
        #expect("가".hk.isHangulAlphabet() == false)
        #expect("값".hk.isHangulAlphabet() == false)
        #expect("ㄱ".hk.isHangulAlphabet() == true)
        #expect("ㅏ".hk.isHangulAlphabet() == true)
        #expect("a".hk.isHangulAlphabet() == false)
    }
    
    // isHangul은 한글 문자열을 받으면 true를 반환한다.
    @Test func isHangul() async throws {
        #expect("값".hk.isHangul() == true)
        #expect("ㄱ".hk.isHangul() == true)
        #expect("ㅏ".hk.isHangul() == true)
        #expect("저는 고양이를 좋아합니다".hk.isHangul() == true)
        #expect("a a".hk.isHangul() == false)
    }

}
