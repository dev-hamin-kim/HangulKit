//
//  susaTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/24/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct susaTests {
    
    let validNumbers: [(num: Int, word: String, classifier: String)] = [
        (1, "하나", "한"),
        (2, "둘", "두"),
        (3, "셋", "세"),
        (4, "넷", "네"),
        (5, "다섯", "다섯"),
        (6, "여섯", "여섯"),
        (7, "일곱", "일곱"),
        (8, "여덟", "여덟"),
        (9, "아홉", "아홉"),
        (10, "열", "열"),
        (11, "열하나", "열한"),
        (12, "열둘", "열두"),
        (20, "스물", "스무"),
        (21, "스물하나", "스물한"),
        (30, "서른", "서른"),
        (99, "아흔아홉", "아흔아홉"),
        (100, "백", "백"),
    ]
    
    
    @Test("순 우리말 수사로 바꿔 반환해야 한다.")
    func test1() async throws {
        validNumbers.forEach { (num, word, _) in
            #expect(HangulKit.susa(of: num) == word)
        }
    }
    
    @Test("순 우리말 수 관형사가 있다면 수 관형사로 없다면 수사로 반환해야 한다.")
    func test2() async throws {
        validNumbers.forEach { (num, _, classifier) in
            #expect(HangulKit.susa(of: num, classifier: true) == classifier)
        }
    }
    
    @Test("유효하지 않은 숫자에 대해 nil을 반환하여야 한다.")
    func test3() async throws {
        let num = 0
        
        #expect(HangulKit.susa(of: num) == nil)
        #expect(HangulKit.susa(of: num, classifier: true) == nil)
    }
}

#endif
