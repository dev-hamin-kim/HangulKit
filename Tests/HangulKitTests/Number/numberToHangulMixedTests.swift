//
//  numberToHangulMixedTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/14/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct numberToHangulMixedTests {
    
    @Test("기본 변환")
    func standardOperation() async throws {
        #expect(HangulKit.numberToHangulMixed(210_000) == "21만")
        #expect(HangulKit.numberToHangulMixed(12_345) == "1만2,345")
        #expect(HangulKit.numberToHangulMixed(123_456_780) == "1억2,345만6,780")
    }
    
    @Test("공백 포함 변환")
    func withSpace() async throws {
        #expect(HangulKit.numberToHangulMixed(210_000, withSpace: true) == "21만")
        #expect(HangulKit.numberToHangulMixed(12_345, withSpace: true) == "1만 2,345")
        #expect(HangulKit.numberToHangulMixed(123_456_780, withSpace: true) == "1억 2,345만 6,780")
    }
    
    @Test("0 이상 10,000 미만인 경우")
    func zeroToTenThousands() async throws {
        #expect(HangulKit.numberToHangulMixed(0) == "0")
        #expect(HangulKit.numberToHangulMixed(1) == "1")
        #expect(HangulKit.numberToHangulMixed(2) == "2")
        #expect(HangulKit.numberToHangulMixed(3) == "3")
        #expect(HangulKit.numberToHangulMixed(4) == "4")
        #expect(HangulKit.numberToHangulMixed(5) == "5")
        #expect(HangulKit.numberToHangulMixed(6) == "6")
        #expect(HangulKit.numberToHangulMixed(7) == "7")
        #expect(HangulKit.numberToHangulMixed(8) == "8")
        #expect(HangulKit.numberToHangulMixed(9) == "9")
        #expect(HangulKit.numberToHangulMixed(10) == "10")
        #expect(HangulKit.numberToHangulMixed(11) == "11")
        #expect(HangulKit.numberToHangulMixed(20) == "20")
        #expect(HangulKit.numberToHangulMixed(30) == "30")
        #expect(HangulKit.numberToHangulMixed(100) == "100")
        #expect(HangulKit.numberToHangulMixed(101) == "101")
        #expect(HangulKit.numberToHangulMixed(110) == "110")
        #expect(HangulKit.numberToHangulMixed(200) == "200")
        #expect(HangulKit.numberToHangulMixed(300) == "300")
        #expect(HangulKit.numberToHangulMixed(1_000) == "1,000")
        #expect(HangulKit.numberToHangulMixed(1_001) == "1,001")
        #expect(HangulKit.numberToHangulMixed(1_100) == "1,100")
        #expect(HangulKit.numberToHangulMixed(1_200) == "1,200")
        #expect(HangulKit.numberToHangulMixed(1_234) == "1,234")
        #expect(HangulKit.numberToHangulMixed(9_999) == "9,999")
    }

    @Test("음수")
    func negativeNumbers() async throws {
        #expect(HangulKit.numberToHangulMixed(-210_000) == "-21만")
        #expect(HangulKit.numberToHangulMixed(-12_345) == "-1만2,345")
        #expect(HangulKit.numberToHangulMixed(-123_456_780) == "-1억2,345만6,780")
        #expect(HangulKit.numberToHangulMixed(-210_000, withSpace: true) == "-21만")
        #expect(HangulKit.numberToHangulMixed(-12_345, withSpace: true) == "-1만 2,345")
        #expect(HangulKit.numberToHangulMixed(-123_456_780, withSpace: true) == "-1억 2,345만 6,780")
    }
    
    @Test("무한대")
    func infiniteNumbers() async throws {
        #expect(HangulKit.numberToHangulMixed(Double.infinity) == "무한대")
        #expect(HangulKit.numberToHangulMixed(-Double.infinity) == "-무한대")
        #expect(HangulKit.numberToHangulMixed(-Double.infinity, withSpace: true) == "-무한대")
    }
    
    @Test("소수")
    func decimalNumbers() async throws {
        #expect(HangulKit.numberToHangulMixed(0.1) == "0.1")
        #expect(HangulKit.numberToHangulMixed(12_345.678) == "1만2,345.678")
        #expect(HangulKit.numberToHangulMixed(-0.1) == "-0.1")
        #expect(HangulKit.numberToHangulMixed(-12_345.678) == "-1만2,345.678")
        #expect(HangulKit.numberToHangulMixed(0.1, withSpace: true) == "0.1")
        #expect(HangulKit.numberToHangulMixed(12_345.678, withSpace: true) == "1만 2,345.678")
        #expect(HangulKit.numberToHangulMixed(-0.1, withSpace: true) == "-0.1")
        #expect(HangulKit.numberToHangulMixed(-12_345.678, withSpace: true) == "-1만 2,345.678")
    }
    
    @Test("유효하지 않은 입력에 대한 오류 처리")
    func invalidInputs() async throws {
        #expect(HangulKit.numberToHangulMixed(Double.nan) == nil)
        #expect(HangulKit.numberToHangulMixed(Float.nan) == nil)
    }
    
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    @Test("유효하지 않은 입력에 대한 오류 처리 - Float16")
    func invalidInputFloat16() async throws {
        #expect(HangulKit.numberToHangulMixed(Float16.nan) == nil)
    }
    
}

#endif
