//
//  convertHangulToQWERTYTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/9/25.
//

import Testing
@testable import HangulKit

struct convertHangulToQWERTYTests {
    
    @Test("한글을 알파벳으로 변환한다.")
    func convert1() {
        #expect(Hangul.convertHangulToQWERTY("뮻") == "abc")
        #expect(Hangul.convertHangulToQWERTY("겨노") == "rush")
        #expect(Hangul.convertHangulToQWERTY("님노") == "slash")
        #expect(Hangul.convertHangulToQWERTY("ㅙㅜㅎ 햐ㅣ애ㅜㅎ") == "hong gildong")
    }
    
    @Test("쌍자음 및 이중모음도 그에 대응되는 영문 알파벳으로 변환한다.")
    func convert2() {
        #expect(Hangul.convertHangulToQWERTY("쨰ㅉ") == "WOW")
        #expect(Hangul.convertHangulToQWERTY("빠짜따까싸") == "QkWkEkRkTk")
        #expect(Hangul.convertHangulToQWERTY("과궈괴귀긔") == "rhkrnjrhlrnlrml")
    }
    
    @Test("영문, 숫자 등 한글이 아닌 글자는 그대로 유지한다.")
    func convert3() {
        #expect(Hangul.convertHangulToQWERTY("iOS개발!") == "iOSroqkf!")
        #expect(Hangul.convertHangulToQWERTY("ㄴ대ㅕㅣ, ㅏㅐㄱㄷㅁ") == "seoul, korea")
    }
    
    @Test("한글 음소 또한 알파벳으로 변환한다.")
    func convert4() {
        #expect(Hangul.convertHangulToQWERTY("ㅍㅡㄹㅗㄴㅌㅡ") == "vmfhsxm")
        #expect(Hangul.convertHangulToQWERTY("RㅏㄱEㅜrl") == "RkrEnrl")
        #expect(Hangul.convertHangulToQWERTY("ㅇPdml") == "dPdml")
    }
    
    @Test("빈 문자열은 빈 문자열을 반환한다.")
    func convert5() {
        #expect(Hangul.convertHangulToQWERTY("") == "")

    }
}
