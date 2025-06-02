//
//  Character+HangulKitTests.swift
//  HangulKit
//
//  Created by 김하민 on 5/24/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct CharacterHangulKitExtensionTests {
    
    struct canBeTests {
        @Test func canBeChoseong() async throws {
            let input: [Character] = [
                "ㄱ", "ㅃ", // 초성이 될 수 있다고 판단되는 경우
                "ㅏ", "ㅘ", "ㄳ", "가" // 초성이 될 수 없다고 판단되는 경우
            ]
            
            let output = [
                true, true,
                false, false, false, false
            ]
            
            for (input, output) in zip(input, output) {
                #expect(input.hk.canBeChoseong() == output)
            }
        }
        
        @Test func canBeJungseong() async throws {
            let input: [Character] = [
                "ㅘ", "ㅏ", // 중성이 될 수 있다고 판단되는 경우
                "ㄱ", "ㄳ", "가" // 중성이 될 수 없다고 판단되는 경우
            ]
            
            let output = [
                true, true,
                false, false, false
            ]
            
            for (input, output) in zip(input, output) {
                #expect(input.hk.canBeJungsung() == output)
            }
        }
        
        @Test func canBeJongseong() async throws {
            let input: [Character] = [
                "ㄱ", "ㄳ", "ㅄ", // 종성이 될 수 있다고 판단되는 경우
                "ㅃ", "ㅘ", "ㅏ" // 종성이 될 수 없다고 판단되는 경우
            ]
            
            let output = [
                true, true, true,
                false, false, false
            ]
            
            for (input, output) in zip(input, output) {
                #expect(input.hk.canbeJongseong() == output)
            }
        }
    }
    
    struct hasBatchimTests {
        @Test // TODO: Test 설명 추가
        func example() {
            let tests: [(input: Character, batchimOption: HangulKit.Batchim, output: Bool?)] = [
                ("값", .both , true),
                ("토", .both , false),
                ("갑", .single , true),
                ("값", .single , false),
                ("값", .double , true),
                ("토", .double , false),
                ("d", .both , nil),
                ("ㅘ", .both , nil),
            ]
            
            tests.forEach { input, batchimOption, output in
                #expect(input.hk.hasBatchim(batchimOption) == output)
            }
        }
    }
}

#endif
