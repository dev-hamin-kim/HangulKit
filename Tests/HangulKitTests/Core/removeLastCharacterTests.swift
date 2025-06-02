//
//  removeLastCharacterTests.swift
//  HangulKit
//
//  Created by 김하민 on 3/29/25.
//

#if swift(>=5.10)
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
        #expect(HangulKit.removeLastCharacter(in: "안녕하세요 값") == "안녕하세요 갑")
        #expect(HangulKit.removeLastCharacter(in: "아이오에스") == "아이오에ㅅ")
        #expect(HangulKit.removeLastCharacter(in: "일요일") == "일요이")
        #expect(HangulKit.removeLastCharacter(in: "전화") == "전호")
        #expect(HangulKit.removeLastCharacter(in: "신세계") == "신세ㄱ")
    }
}

#endif
