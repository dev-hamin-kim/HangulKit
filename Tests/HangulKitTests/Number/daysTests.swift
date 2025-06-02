//
//  daysTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/10/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

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
            #expect(HangulKit.days(input) == output)
        }
    }
    
    
    // MARK: 아래 테스트 코드에 대한 생각을 해볼 것.
    // 근데... Swift Integer 타입 쓰면 저것들 다 걸러지잖어...
    // 0이랑 음수들은 함수 가드문에서 걸렀고...
//
//      const invalidNumbers = [0, -1, 31, 1.1, -1.1, Infinity, -Infinity, NaN];
//
//      invalidNumbers.forEach(num => {
//        it(`유효하지 않은 숫자 ${num}에 대해 오류를 발생시켜야 한다.`, () => {
//          expect(() => days(num)).toThrow('지원하지 않는 숫자입니다.');
//        });
//      });
//    });
}

#endif
