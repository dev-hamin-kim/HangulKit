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
        #expect(Hangul.numberToHangul(210_000) == "이십일만")
        #expect(Hangul.numberToHangul(12_345) == "일만이천삼백사십오")
        #expect(Hangul.numberToHangul(123_456_780) == "일억이천삼백사십오만육천칠백팔십")
        #expect(Hangul.numberToHangul(100_000_000) == "일억")
        #expect(Hangul.numberToHangul(1_000_000_000_000) == "일조")
    }
    
    @Test("공백 포함 변환")
    func withSpacing() async throws {
        #expect(Hangul.numberToHangul(210_000, withSpacing: true) == "이십일만")
        #expect(Hangul.numberToHangul(12_345, withSpacing: true) == "일만 이천삼백사십오")
        #expect(Hangul.numberToHangul(123_456_780, withSpacing: true) == "일억 이천삼백사십오만 육천칠백팔십")
    }
    
    @Test("0 이상 10,000 미만인 경우")
    func zeroToTenThousands() async throws {
        #expect(Hangul.numberToHangul(0) == "영")
        #expect(Hangul.numberToHangul(1) == "일")
        #expect(Hangul.numberToHangul(2) == "이")
        #expect(Hangul.numberToHangul(3) == "삼")
        #expect(Hangul.numberToHangul(4) == "사")
        #expect(Hangul.numberToHangul(5) == "오")
        #expect(Hangul.numberToHangul(6) == "육")
        #expect(Hangul.numberToHangul(7) == "칠")
        #expect(Hangul.numberToHangul(8) == "팔")
        #expect(Hangul.numberToHangul(9) == "구")
        #expect(Hangul.numberToHangul(10) == "십")
        #expect(Hangul.numberToHangul(11) == "십일")
        #expect(Hangul.numberToHangul(20) == "이십")
        #expect(Hangul.numberToHangul(30) == "삼십")
        #expect(Hangul.numberToHangul(100) == "백")
        #expect(Hangul.numberToHangul(101) == "백일")
        #expect(Hangul.numberToHangul(110) == "백십")
        #expect(Hangul.numberToHangul(200) == "이백")
        #expect(Hangul.numberToHangul(300) == "삼백")
        #expect(Hangul.numberToHangul(1_000) == "천")
        #expect(Hangul.numberToHangul(1_001) == "천일")
        #expect(Hangul.numberToHangul(1_100) == "천백")
        #expect(Hangul.numberToHangul(1_200) == "천이백")
        #expect(Hangul.numberToHangul(1_234) == "천이백삼십사")
        #expect(Hangul.numberToHangul(9_999) == "구천구백구십구")
    }
    
    @Test("음수")
    func negativeNumbers() async throws {
        #expect(Hangul.numberToHangul(-210_000) == "마이너스이십일만")
        #expect(Hangul.numberToHangul(-12_345) == "마이너스일만이천삼백사십오")
        #expect(Hangul.numberToHangul(-123_456_780) == "마이너스일억이천삼백사십오만육천칠백팔십")
        #expect(Hangul.numberToHangul(-210_000, withSpacing: true) == "마이너스 이십일만")
        #expect(Hangul.numberToHangul(-12_345, withSpacing: true) == "마이너스 일만 이천삼백사십오")
        #expect(Hangul.numberToHangul(-123_456_780, withSpacing: true) == "마이너스 일억 이천삼백사십오만 육천칠백팔십")
    }
    
    @Test("무한대")
    func infiniteNumbers() async throws {
        #expect(throws: Never.self) {
            try Hangul.numberToHangul(Double.infinity) == "무한대"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangul(-Double.infinity) == "마이너스무한대"
        }
        
        #expect(throws: Never.self) {
            try Hangul.numberToHangul(-Double.infinity, withSpacing: true) == "마이너스 무한대"
        }
    }
    
    @Test("소수")
    func decimalNumbers() async throws {
        #expect(throws: Never.self) {
            try Hangul.numberToHangul(0.1) == "영점일"
            try Hangul.numberToHangul(12_345.678) == "일만이천삼백사십오점육칠팔"
            try Hangul.numberToHangul(-0.1) == "마이너스영점일"
            try Hangul.numberToHangul(-12_345.678) == "마이너스일만이천삼백사십오점육칠팔"
        }
        #expect(throws: Never.self) {
            try Hangul.numberToHangul(0.1, withSpacing: true) == "영점 일"
            try Hangul.numberToHangul(12_345.678, withSpacing: true) == "일만 이천삼백사십오점 육칠팔"
            try Hangul.numberToHangul(-0.1, withSpacing: true) == "마이너스 영점 일"
            try Hangul.numberToHangul(-12_345.678, withSpacing: true) == "마이너스 일만 이천삼백사십오점 육칠팔"
        }
    }
    
    @Test("유효하지 않은 입력에 대한 오류 처리")
    func invalidInputs() async throws {
        #expect(throws: Hangul.InputError.notANumber) {
            try Hangul.numberToHangul(Double.nan)
            try Hangul.numberToHangul(Float.nan)
            try Hangul.numberToHangul(Float16.nan)
        }
    }
}
