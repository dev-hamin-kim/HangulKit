//
//  removeLastCharacterTests.swift
//  HangulKit
//
//  Created by 김하민 on 3/29/25.
//

import Testing
@testable import HangulKit

struct removeLastCharacterTests {
    
    /// removeLastCharacter("안녕하세요 값") // 안녕하세요 갑
    /// removeLastCharacter("아이오에스") // 아이오에ㅅ
    /// removeLastCharacter("일요일") // 일요이
    /// removeLastCharacter("전화") // 전호
    /// removeLastCharacter("신세계") // 신세ㄱ
    @Test
    func remove() {
        #expect(Hangul.removeLastCharacter("안녕하세요 값") == "안녕하세요 갑")
        #expect(Hangul.removeLastCharacter("아이오에스") == "아이오에ㅅ")
        #expect(Hangul.removeLastCharacter("일요일") == "일요이")
        #expect(Hangul.removeLastCharacter("전화") == "전호")
        #expect(Hangul.removeLastCharacter("신세계") == "신세ㄱ")
    }
}
