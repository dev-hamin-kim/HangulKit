//
//  Array+HangulKitTests.swift
//  HangulKit
//
//  Created by 김하민 on 5/24/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct ArrayHangulKitExtensionTests {
    
    @Test("온전한 한글과 한글 문자 조합")
    func assemble1() {
        let input = ["아버지가", " ", "방ㅇ", "ㅔ ", "들ㅇ", "ㅓ갑니다"]
        let output = "아버지가 방에 들어갑니다"
        
        #expect(input.hk.assemble() == output)
    }
    
    @Test("온전한 한글만 조합")
    func assemble2() {
        let input = ["아버지가", " ", "방에", " ", "들어갑니다"]
        let output = "아버지가 방에 들어갑니다"
        
        #expect(input.hk.assemble() == output)
    }
    
    @Test("온전하지 않은 한글만 조합")
    func assemble3() {
        let input = ["아버지가", " ", "방에", " ", "들어갑니다"]
        let output = "아버지가 방에 들어갑니다"
        
        #expect(input.hk.assemble() == output)
    }
    
    @Test("[Character] 조합")
    func assemble4() {
        let input = [
            "아", "버", "지", "가", " ",
            "방", "에", " ",
            "들", "어", "갑", "니", "다"
        ]
        let output = "아버지가 방에 들어갑니다"
        
        #expect(input.hk.assemble() == output)
    }
}

#endif
