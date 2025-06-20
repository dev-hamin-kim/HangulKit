//
//  assembleTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/9/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct assembleTests {
    
    @Test("온전한 한글과 한글 문자 조합")
    func assemble1() {
        #expect(HangulKit.assemble(["아버지가", " ", "방ㅇ", "ㅔ ", "들ㅇ", "ㅓ갑니다"]) == "아버지가 방에 들어갑니다")
    }
    
    @Test("온전한 한글만 조합")
    func assemble2() {
        #expect(HangulKit.assemble(["아버지가", " ", "방에", " ", "들어갑니다"]) == "아버지가 방에 들어갑니다")
    }
    
    @Test("온전하지 않은 한글만 조합")
    func assemble3() {
        #expect(HangulKit.assemble(["ㅇ", "ㅏ", "ㅂ", "ㅓ", "ㅈ", "ㅣ"]) == "아버지")
    }
    
    @Test("[Character] 조합")
    func assemble4() {
        let 아버지가 = HangulKit.assemble([
            "아", "버", "지", "가", " ",
            "방", "에", " ",
            "들", "어", "갑", "니", "다"
        ])
        
        #expect(아버지가 == "아버지가 방에 들어갑니다")
    }
}

#endif
