//
//  binaryAssembleCharactersTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/3/25.
//

import Testing
@testable import HangulKit

struct binaryAssembleCharactersTests {
    
    @Test("초성과 중성만 조합")
    func assemble1() {
        #expect(HangulKit.binaryAssembleCharacters("ㄱ", "ㅏ") == "가")
    }
    
    @Test("초성과 중성이 합쳐진 문자와 종성을 조합")
    func assemble2() {
        #expect(HangulKit.binaryAssembleCharacters("가", "ㅇ") == "강")
    }
    
    @Test("초성과 중성과 종성이 합쳐진 문자와 자음을 조합하여 겹받침 만들기")
    func assemble3() {
        #expect(HangulKit.binaryAssembleCharacters("갑", "ㅅ") == "값")
    }

    @Test("초성과 중성이 합쳐진 문자와 모음을 조립하여 겹모음 만들기")
    func assemble4() {
        #expect(HangulKit.binaryAssembleCharacters("고", "ㅏ") == "과")
    }
    
    @Test("초성과 중성(겹모음)이 합쳐진 문자와 자음을 조합")
    func assemble5() {
        #expect(HangulKit.binaryAssembleCharacters("과", "ㄱ") == "곽")
    }
    
    @Test("초성과 중성(겹모음)과 종성이 합쳐진 문자와 자음을 조합하여 겹받침 만들기")
    func assemble6() {
        #expect(HangulKit.binaryAssembleCharacters("완", "ㅈ") == "왅")
    }

    @Test("모음만 있는 문자와 모음을 조합하여 겹모음 만들기")
    func assemble7() {
        #expect(HangulKit.binaryAssembleCharacters("ㅗ", "ㅏ") == "ㅘ")
    }

    @Test("초성과 중성과 종성이 합쳐진 문자의 연음 법칙")
    func assemble8() {
        #expect(HangulKit.binaryAssembleCharacters("톳", "ㅡ") == "토스")
    }

    @Test("초성과 종성(겹모음)과 종성이 합쳐진 문자의 연음 법칙")
    func assemble9() {
        #expect(HangulKit.binaryAssembleCharacters("왅", "ㅓ") == "완저")
    }
    
    @Test("초성과 중성과 종성(겹받침)이 합쳐진 문자의 연음 법칙")
    func assemble10() {
        #expect(HangulKit.binaryAssembleCharacters("닭", "ㅏ") == "달가")
        #expect(HangulKit.binaryAssembleCharacters("깎", "ㅏ") == "까까")
    }

    @Test("문법에 맞지 않는 문자를 조합하면 단순 Join 한다. (문법 순서 틀림)")
    func assemble11() {
        #expect(HangulKit.binaryAssembleCharacters("ㅏ", "ㄱ") == "ㅏㄱ")
        #expect(HangulKit.binaryAssembleCharacters("까", "ㅃ") == "까ㅃ")
        #expect(HangulKit.binaryAssembleCharacters("ㅘ", "ㅏ") == "ㅘㅏ")
    }
    
    @Test("순서대로 입력했을 때 조합이 불가능한 문자라면 단순 Join 한다.")
    func assemble12() {
        #expect(HangulKit.binaryAssembleCharacters("뼈", "ㅣ") == "뼈ㅣ")
    }

    
//      it('소스가 두 글자 이상이라면 Invalid source 에러를 발생시킨다.', () => {
//        expect(() => binaryAssembleCharacters('가나', 'ㄴ')).toThrowError(
//          'Invalid source character: 가나. Source must be one character.'
//        );
//        expect(() => binaryAssembleCharacters('ㄱㄴ', 'ㅏ')).toThrowError(
//          'Invalid source character: ㄱㄴ. Source must be one character.'
//        );
//      });
// 위의 테스트는 Character와 String을 다르게 취급하는 Swift 특성 상 컴파일러에서 에러를 던지므로 미구현.
}
