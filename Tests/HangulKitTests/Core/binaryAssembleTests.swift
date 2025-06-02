//
//  binaryAssembleTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/8/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct binaryAssembleTests {
    
    @Test("문장과 모음을 조합하여 다음 글자를 생성한다.")
    func assemble1() {
        #expect(HangulKit.binaryAssemble("저는 고양이를 좋아합닏", "ㅏ") == "저는 고양이를 좋아합니다")
    }
    
    @Test("문장과 자음을 조합하여 홑받침을 생성한다.")
    func assemble2() {
        #expect(HangulKit.binaryAssemble("저는 고양이를 좋아하", "ㅂ") == "저는 고양이를 좋아합")
    }
    
    @Test("문장과 자음을 조합하여 겹받침을 생성한다.")
    func assemble3() {
        #expect(HangulKit.binaryAssemble("저는 고양이를 좋아합", "ㅅ") == "저는 고양이를 좋아핪")
    }
    
    @Test("조합이 불가능한 자음이 입력되면 단순 Join 한다.")
    func assemble4() {
        #expect(HangulKit.binaryAssemble("저는 고양이를 좋아합", "ㄲ") == "저는 고양이를 좋아합ㄲ")
        #expect(HangulKit.binaryAssemble("저는 고양이를 좋아합", "ㅂ") == "저는 고양이를 좋아합ㅂ")
    }
    
    @Test("조합이 불가능한 모음이 입력되면 단순 Join 한다.")
    func assemble5() {
        #expect(HangulKit.binaryAssemble("저는 고양이를 좋아하", "ㅏ") == "저는 고양이를 좋아하ㅏ")
        #expect(HangulKit.binaryAssemble("저는 고양이를 좋아합니다", "ㅜ") == "저는 고양이를 좋아합니다ㅜ")
    }

}

#endif
