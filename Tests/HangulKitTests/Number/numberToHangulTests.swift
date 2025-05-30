//
//  numberToHangulTests.swift
//  HangulKit
//
//  Created by 김하민 on 3/23/25.
//

import Testing
@testable import HangulKit

struct numberToHangulTests {
    
    @Test("기본 변환")
    func standardOperation() async throws {
        let tests: [(input: Int, output: String)] = [
            (210_000, "이십일만"),
            (12_345, "일만이천삼백사십오"),
            (123_456_780, "일억이천삼백사십오만육천칠백팔십"),
            (100_000_000, "일억"),
            (1_000_000_000_000, "일조")
        ]

        tests.forEach { input, output in
            #expect(HangulKit.numberToHangul(input) == output)
        }
    }
    
    @Test("공백 포함 변환")
    func withSpace() async throws {
        let tests: [(input: Int, output: String)] = [
            (210_000, "이십일만"),
            (12_345, "일만 이천삼백사십오"),
            (123_456_780, "일억 이천삼백사십오만 육천칠백팔십"),
        ]

        tests.forEach { input, output in
            #expect(HangulKit.numberToHangul(input, withSpace: true) == output)
        }
    }
    
    @Test("0 이상 10,000 미만인 경우")
    func zeroToTenThousands() async throws {
        let tests: [(input: Int, output: String)] = [
            (0, "영"),
            (1, "일"),
            (2, "이"),
            (3, "삼"),
            (4, "사"),
            (5, "오"),
            (6, "육"),
            (7, "칠"),
            (8, "팔"),
            (9, "구"),
            (10, "십"),
            (11, "십일"),
            (20, "이십"),
            (30, "삼십"),
            (100, "백"),
            (101, "백일"),
            (110, "백십"),
            (200, "이백"),
            (300, "삼백"),
            (1_000, "천"),
            (1_001, "천일"),
            (1_100, "천백"),
            (1_200, "천이백"),
            (1_234, "천이백삼십사"),
            (9_999, "구천구백구십구"),
        ]

        tests.forEach { input, output in
            #expect(HangulKit.numberToHangul(input) == output)
        }
    }
    
    @Test("음수")
    func negativeNumbers() async throws {
        let tests: [(input: Int, withSpace: Bool, output: String)] = [
            (-210_000, false, "마이너스이십일만"),
            (-12_345, false, "마이너스일만이천삼백사십오"),
            (-123_456_780, false, "마이너스일억이천삼백사십오만육천칠백팔십"),
            (-210_000, true, "마이너스 이십일만"),
            (-12_345, true, "마이너스 일만 이천삼백사십오"),
            (-123_456_780, true, "마이너스 일억 이천삼백사십오만 육천칠백팔십"),
        ]

        tests.forEach { input, withSpace, output in
            #expect(HangulKit.numberToHangul(input, withSpace: withSpace) == output)
        }
    }
    
    @Test("무한대")
    func infiniteNumbers() async throws {
        #expect(HangulKit.numberToHangul(Double.infinity) == "무한대")
        #expect(HangulKit.numberToHangul(-Double.infinity) == "마이너스무한대")
        #expect(HangulKit.numberToHangul(-Double.infinity, withSpace: true) == "마이너스 무한대")
    }
    
    @Test("소수")
    func decimalNumbers() async throws {
        let tests: [(input: Double, withSpace: Bool, output: String)] = [
            (0.1, false, "영점일"),
            (12_345.678, false, "일만이천삼백사십오점육칠팔"),
            (-0.1, false, "마이너스영점일"),
            (-12_345.678, false, "마이너스일만이천삼백사십오점육칠팔"),
            (0.1, true, "영점 일"),
            (12_345.678, true, "일만 이천삼백사십오점 육칠팔"),
            (-0.1, true, "마이너스 영점 일"),
            (-12_345.678, true, "마이너스 일만 이천삼백사십오점 육칠팔"),
        ]

        tests.forEach { input, withSpace, output in
            #expect(HangulKit.numberToHangul(input, withSpace: withSpace) == output)
        }
    }
    
    @Test("유효하지 않은 입력에 대한 오류 처리")
    func invalidInputs() async throws {
        #expect(HangulKit.numberToHangul(Double.nan) == nil)
        #expect(HangulKit.numberToHangul(Float.nan) == nil)
    }
    
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    @Test("유효하지 않은 입력에 대한 오류 처리 - Float16")
    func invalidInputFloat16() async throws {
        #expect(HangulKit.numberToHangul(Float16.nan) == nil)
    }
}
