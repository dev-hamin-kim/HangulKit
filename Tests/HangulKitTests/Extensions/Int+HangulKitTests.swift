//
//  Int+HangulKitTests.swift
//  HangulKit
//
//  Created by 김하민 on 5/26/25.
//

import Testing
@testable import HangulKit

struct IntHangulKitExtensionTests {
    struct daysTests {
        
        @Test
        func example() {
            let tests: [(input: Int, output: String?)] = [
                (1, "하루"),
                (2, "이틀"),
                (3, "사흘"),
                (4, "나흘"),
                (5, "닷새"),
                (6, "엿새"),
                (7, "이레"),
                (8, "여드레"),
                (9, "아흐레"),
                (10, "열흘"),
                (11, "열하루"),
                (20, "스무날"),
                (21, "스무하루"),
                (30, "서른날"),
                
                (0, nil),
                (31, nil)
            ]
            
            tests.forEach { input, output in
                #expect(input.hk.days() == output)
            }
        }
    }
    
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
                #expect(input.hk.numberToHangul() == output)
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
                #expect(input.hk.numberToHangul(withSpace: true) == output)
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
                #expect(input.hk.numberToHangul() == output)
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
                #expect(input.hk.numberToHangul(withSpace: withSpace) == output)
            }
        }
        
        @Test("무한대")
        func infiniteNumbers() async throws {
            let positiveInfinity = Double.infinity
            let negativeInfinity = -Double.infinity
            
            #expect(positiveInfinity.hk.numberToHangul() == "무한대")
            #expect(negativeInfinity.hk.numberToHangul() == "마이너스무한대")
            #expect(negativeInfinity.hk.numberToHangul(withSpace: true) == "마이너스 무한대")
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
                #expect(input.hk.numberToHangul(withSpace: withSpace) == output)
            }
        }
        
        @Test("유효하지 않은 입력에 대한 오류 처리")
        func invalidInputs() async throws {
            #expect(Double.nan.hk.numberToHangul() == nil)
            #expect(Float.nan.hk.numberToHangul() == nil)
        }
        
        @available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
        @Test("유효하지 않은 입력에 대한 오류 처리 - Float16")
        func invalidInputFloat16() async throws {
            #expect(Float16.nan.hk.numberToHangul() == nil)
        }
    }
    
    struct numberToHangulMixedTests {
        
        @Test("기본 변환")
        func standardOperation() async throws {
            let tests: [(input: Int, output: String)] = [
                (210_000, "21만"),
                (12_345, "1만2,345"),
                (123_456_780, "1억2,345만6,780"),
            ]
            
            tests.forEach { input, output in
                #expect(input.hk.numberToHangulMixed() == output)
            }
        }
        
        @Test("공백 포함 변환")
        func withSpace() async throws {
            let tests: [(input: Int, output: String)] = [
                (210_000, "21만"),
                (12_345, "1만 2,345"),
                (123_456_780, "1억 2,345만 6,780"),
            ]
            
            tests.forEach { input, output in
                #expect(input.hk.numberToHangulMixed(withSpace: true) == output)
            }
        }
        
        @Test("0 이상 10,000 미만인 경우")
        func zeroToTenThousands() async throws {
            let tests: [(input: Int, output: String)] = [
                (0, "0"),
                (1, "1"),
                (2, "2"),
                (3, "3"),
                (4, "4"),
                (5, "5"),
                (6, "6"),
                (7, "7"),
                (8, "8"),
                (9, "9"),
                (10, "10"),
                (11, "11"),
                (20, "20"),
                (30, "30"),
                (100, "100"),
                (101, "101"),
                (110, "110"),
                (200, "200"),
                (300, "300"),
                (1_000, "1,000"),
                (1_001, "1,001"),
                (1_100, "1,100"),
                (1_200, "1,200"),
                (1_234, "1,234"),
                (9_999, "9,999"),
            ]
            
            tests.forEach { input, output in
                #expect(input.hk.numberToHangulMixed() == output)
            }
        }

        @Test("음수")
        func negativeNumbers() async throws {
            let tests: [(input: Int, withSpace: Bool, output: String)] = [
                (-210_000, false, "-21만"),
                (-12_345, false, "-1만2,345"),
                (-123_456_780, false, "-1억2,345만6,780"),
                (-210_000, true, "-21만"),
                (-12_345, true, "-1만 2,345"),
                (-123_456_780, true, "-1억 2,345만 6,780"),
            ]
            
            tests.forEach { input, withSpace, output in
                #expect(input.hk.numberToHangulMixed(withSpace: withSpace) == output)
            }
        }
        
        @Test("무한대")
        func infiniteNumbers() async throws {
            let positiveInfinity = Double.infinity
            let negativeInfinity = -Double.infinity
            
            #expect(positiveInfinity.hk.numberToHangulMixed() == "무한대")
            #expect(negativeInfinity.hk.numberToHangulMixed() == "-무한대")
            #expect(negativeInfinity.hk.numberToHangulMixed(withSpace: true) == "-무한대")
        }
        
        @Test("소수")
        func decimalNumbers() async throws {
            let tests: [(input: Double, withSpace: Bool, output: String)] = [
                (0.1, false, "0.1"),
                (12_345.678, false, "1만2,345.678"),
                (-0.1, false, "-0.1"),
                (-12_345.678, false, "-1만2,345.678"),
                
                (0.1, true, "0.1"),
                (12_345.678, true, "1만 2,345.678"),
                (-0.1, true, "-0.1"),
                (-12_345.678, true, "-1만 2,345.678"),
            ]
            
            tests.forEach { input, withSpace, output in
                #expect(input.hk.numberToHangulMixed(withSpace: withSpace) == output)
            }
        }
        
        @Test("유효하지 않은 입력에 대한 오류 처리")
        func invalidInputs() async throws {
            #expect(Double.nan.hk.numberToHangulMixed() == nil)
            #expect(Float.nan.hk.numberToHangulMixed() == nil)
        }
        
        @available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
        @Test("유효하지 않은 입력에 대한 오류 처리 - Float16")
        func invalidInputFloat16() async throws {
            #expect(Float16.nan.hk.numberToHangulMixed() == nil)
        }
        
    }

    struct SeosusaTests {
        @Test("순 우리말 서수사로 변환한다.")
        func test1() async throws {
            let validNumbers: [(num: Int, word: String?)] = [
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
                (Int.max, "구백이십이경삼천삼백칠십이조삼백육십팔억오천사백칠십칠만오천팔백칠째"),
            ]
            
            for (input, output) in validNumbers {
                #expect(input.hk.seosusa() == output)
            }
        }
        
        @Test("유효하지 않은 숫자에 대해 nil을 반환하여야 한다.")
        func test2() async throws {
            let input = [0, -1, Int.min]
            
            input.forEach { input in
                #expect(input.hk.seosusa() == nil)
            }
        }
    }

    
}
