//
//  seosusaTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/24/25.
//

import Testing
@testable import HangulKit

struct SeosusaTests {
    
    @Test("순 우리말 서수사로 변환한다.")
    func test1() async throws {
        let validNumbers: [(num: Int, word: String)] = [
            (1, "첫째"),
            (2, "둘째"),
            (3, "셋째"), // '셋째'가 표준어이고 '세째'는 비표준어이다.(표준어 사정 원칙 제6항)
            (4, "넷째"), // '넷째'가 표준어이고 '네째'는 비표준어이다.(표준어 사정 원칙 제6항)
            (5, "다섯째"),
            (6, "여섯째"),
            (7, "일곱째"),
            (8, "여덟째"),
            (9, "아홉째"),
            (10, "열째"),
            (11, "열한째"),
            (12, "열두째"), // '둘째'는 십 단위 이상의 서수사에 쓰일 때에 '두째'로 한다.(표준어 사정 원칙 제6항)
            (13, "열셋째"),
            (14, "열넷째"),
            (15, "열다섯째"),
            (20, "스무째"),
            (21, "스물한째"),
            (22, "스물두째"),
            (30, "서른째"),
            (40, "마흔째"),
            (90, "아흔째"),
            (99, "아흔아홉째"),
            (100, "백째"),
            (101, "백일째"),
        ]
        
        for (input, output) in validNumbers {
            #expect(HangulKit.seosusa(of: input) == output)
        }
    }
    
    @Test("유효하지 않은 숫자에 대해 오류를 발생시켜야 한다.")
    func test2() async throws {
        #expect(HangulKit.seosusa(of: 0) == "1이상의 정수만 지원합니다.")
    }
}
