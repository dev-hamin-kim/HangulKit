//
//  convertHangulToQWERTYTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/9/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct convertHangulToQWERTYTests {
    
    @Test("한글을 알파벳으로 변환한다.")
    func convert1() {
        #expect(HangulKit.convertHangulToQWERTY("뮻") == "abc")
        #expect(HangulKit.convertHangulToQWERTY("겨노") == "rush")
        #expect(HangulKit.convertHangulToQWERTY("님노") == "slash")
        #expect(HangulKit.convertHangulToQWERTY("ㅙㅜㅎ 햐ㅣ애ㅜㅎ") == "hong gildong")
    }
    
    @Test("쌍자음 및 이중모음도 그에 대응되는 영문 알파벳으로 변환한다.")
    func convert2() {
        #expect(HangulKit.convertHangulToQWERTY("쨰ㅉ") == "WOW")
        #expect(HangulKit.convertHangulToQWERTY("빠짜따까싸") == "QkWkEkRkTk")
        #expect(HangulKit.convertHangulToQWERTY("과궈괴귀긔") == "rhkrnjrhlrnlrml")
    }
    
    @Test("영문, 숫자 등 한글이 아닌 글자는 그대로 유지한다.")
    func convert3() {
        #expect(HangulKit.convertHangulToQWERTY("iOS개발!") == "iOSroqkf!")
        #expect(HangulKit.convertHangulToQWERTY("ㄴ대ㅕㅣ, ㅏㅐㄱㄷㅁ") == "seoul, korea")
    }
    
    @Test("한글 음소 또한 알파벳으로 변환한다.")
    func convert4() {
        #expect(HangulKit.convertHangulToQWERTY("ㅍㅡㄹㅗㄴㅌㅡ") == "vmfhsxm")
        #expect(HangulKit.convertHangulToQWERTY("RㅏㄱEㅜrl") == "RkrEnrl")
        #expect(HangulKit.convertHangulToQWERTY("ㅇPdml") == "dPdml")
    }
    
    @Test("빈 문자열은 빈 문자열을 반환한다.")
    func convert5() {
        #expect(HangulKit.convertHangulToQWERTY("") == "")

    }
}

#endif
