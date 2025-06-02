//
//  convertQWERTYToAlphabetTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/10/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct convertQWERTYToAlphabetTests {
    
    @Test("영어 알파벳을 한글 음소로 바꾼다.")
    func covert1() {
        #expect(HangulKit.convertQWERTYToAlphabet("abc") == "ㅁㅠㅊ")
    }
    
    @Test("쌍/자모음에 대응하지 않는 영어 알파벳을 한글 음소로 바꾼다.")
    func covert2() {
        #expect(HangulKit.convertQWERTYToAlphabet("ABC") == "ㅁㅠㅊ")
    }

    @Test("영어 알파벳은 한글 음소로 바꾸고, 한글 음절은 유지한다.")
    func covert3() {
        #expect(HangulKit.convertQWERTYToAlphabet("dkdldh에스") == "ㅇㅏㅇㅣㅇㅗ에스")
        #expect(HangulKit.convertQWERTYToAlphabet("vm론트") == "ㅍㅡ론트")
    }
    
    @Test("분해된 한글 음소는 유지한다.")
    func covert4() {
        #expect(HangulKit.convertQWERTYToAlphabet("ㅇㅏㅇㅣㅇㅗㅇㅔㅅㅡ") == "ㅇㅏㅇㅣㅇㅗㅇㅔㅅㅡ")
        #expect(HangulKit.convertQWERTYToAlphabet("ㅍㅡㄹㅗㄴㅌㅡ") == "ㅍㅡㄹㅗㄴㅌㅡ")
    }
    
    @Test("영어 알파벳이 아닌 입력은 유지한다.")
    func covert5() {
        #expect(HangulKit.convertQWERTYToAlphabet("4월/20dlf!") == "4월/20ㅇㅣㄹ!")
    }
    
    @Test("영문 대문자는 쌍자/모음으로 바꾼다.")
    func covert6() {
        #expect(HangulKit.convertQWERTYToAlphabet("RㅏㄱEㅜrl") == "ㄲㅏㄱㄸㅜㄱㅣ")
        #expect(HangulKit.convertQWERTYToAlphabet("ㅇPdml") == "ㅇㅖㅇㅡㅣ")
    }
    
    @Test("빈 문자열은 빈 문자열을 반환한다.")
    func covert7() {
        #expect(HangulKit.convertQWERTYToAlphabet("") == "")
    }
}

#endif
