//
//  numberToHangulMixedTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/14/25.
//

import Testing
@testable import HangulKit

struct numberToHangulMixedTests {
    
    @Test("기본 변환")
    func standardOperation() async throws {
        #expect(Hangul.numberToHangulMixed(210_000) == "21만")
        #expect(Hangul.numberToHangulMixed(12_345) == "1만2,345")
        #expect(Hangul.numberToHangulMixed(123_456_780) == "1억2,345만6,780")
    }
    
    @Test("공백 포함 변환")
    func withSpacing() async throws {
        #expect(Hangul.numberToHangulMixed(210_000, withSpacing: true) == "21만")
        #expect(Hangul.numberToHangulMixed(12_345, withSpacing: true) == "1만 2,345")
        #expect(Hangul.numberToHangulMixed(123_456_780, withSpacing: true) == "1억 2,345만 6,780")
    }
    
    @Test("0 이상 10,000 미만인 경우")
    func zeroToTenThousands() async throws {
        #expect(Hangul.numberToHangulMixed(0) == "0")
        #expect(Hangul.numberToHangulMixed(1) == "1")
        #expect(Hangul.numberToHangulMixed(2) == "2")
        #expect(Hangul.numberToHangulMixed(3) == "3")
        #expect(Hangul.numberToHangulMixed(4) == "4")
        #expect(Hangul.numberToHangulMixed(5) == "5")
        #expect(Hangul.numberToHangulMixed(6) == "6")
        #expect(Hangul.numberToHangulMixed(7) == "7")
        #expect(Hangul.numberToHangulMixed(8) == "8")
        #expect(Hangul.numberToHangulMixed(9) == "9")
        #expect(Hangul.numberToHangulMixed(10) == "10")
        #expect(Hangul.numberToHangulMixed(11) == "11")
        #expect(Hangul.numberToHangulMixed(20) == "20")
        #expect(Hangul.numberToHangulMixed(30) == "30")
        #expect(Hangul.numberToHangulMixed(100) == "100")
        #expect(Hangul.numberToHangulMixed(101) == "101")
        #expect(Hangul.numberToHangulMixed(110) == "110")
        #expect(Hangul.numberToHangulMixed(200) == "200")
        #expect(Hangul.numberToHangulMixed(300) == "300")
        #expect(Hangul.numberToHangulMixed(1_000) == "1,000")
        #expect(Hangul.numberToHangulMixed(1_001) == "1,001")
        #expect(Hangul.numberToHangulMixed(1_100) == "1,100")
        #expect(Hangul.numberToHangulMixed(1_200) == "1,200")
        #expect(Hangul.numberToHangulMixed(1_234) == "1,234")
        #expect(Hangul.numberToHangulMixed(9_999) == "9,999")
    }

    @Test("음수")
    func negativeNumbers() async throws {
        #expect(Hangul.numberToHangulMixed(-210_000) == "-21만")
        #expect(Hangul.numberToHangulMixed(-12_345) == "-1만2,345")
        #expect(Hangul.numberToHangulMixed(-123_456_780) == "-1억2,345만6,780")
        #expect(Hangul.numberToHangulMixed(-210_000, withSpacing: true) == "-21만")
        #expect(Hangul.numberToHangulMixed(-12_345, withSpacing: true) == "-1만 2,345")
        #expect(Hangul.numberToHangulMixed(-123_456_780, withSpacing: true) == "-1억 2,345만 6,780")
    }
    
    @Test("무한대")
    func infiniteNumbers() async throws {
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(Double.infinity) == "무한대"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(-Double.infinity) == "-무한대"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(-Double.infinity, withSpacing: true) == "-무한대"
        }
    }
    
    @Test("소수")
    func decimalNumbers() async throws {
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(0.1) == "0.1"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(12_345.678) == "1만2,345.678"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(-0.1) == "-0.1"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(-12_345.678) == "-1만2,345.678"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(0.1, withSpacing: true) == "0.1"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(12_345.678, withSpacing: true) == "1만 2,345.678"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(-0.1, withSpacing: true) == "-0.1"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangulMixed(-12_345.678, withSpacing: true) == "-1만 2,345.678"
        }
    }
    
    @Test("유효하지 않은 입력에 대한 오류 처리")
    func invalidInputs() async throws {
        #expect(throws: Hangul.InputError.notANumber) {
            try Hangul.numberToHangulMixed(Double.nan)
        }
        
        #expect(throws: Hangul.InputError.notANumber) {
            try Hangul.numberToHangulMixed(Float.nan)
        }
        
        #expect(throws: Hangul.InputError.notANumber) {
            try Hangul.numberToHangulMixed(Float16.nan)
        }
    }
}

