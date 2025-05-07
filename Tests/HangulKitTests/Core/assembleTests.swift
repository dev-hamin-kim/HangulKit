//
//  assembleTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/9/25.
//

import Testing
@testable import HangulKit

struct assembleTests {
    
    @Test("온전한 한글과 한글 문자 조합")
    func assemble1() {
        #expect(Hangul.assemble(["아버지가", " ", "방ㅇ", "ㅔ ", "들ㅇ", "ㅓ갑니다"]) == "아버지가 방에 들어갑니다")
    }
    
    @Test("온전한 한글만 조합")
    func assemble2() {
        #expect(Hangul.assemble(["아버지가", " ", "방에", " ", "들어갑니다"]) == "아버지가 방에 들어갑니다")
    }
    
    @Test("온전하지 않은 한글만 조합")
    func assemble3() {
        #expect(Hangul.assemble(["ㅇ", "ㅏ", "ㅂ", "ㅓ", "ㅈ", "ㅣ"]) == "아버지")
    }
}
