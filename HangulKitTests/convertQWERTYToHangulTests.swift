//
//  convertQWERTYToHangulTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/10/25.
//

import Testing
@testable import HangulKit

struct convertQWERTYToHangulTests {
    
    @Test("영어 알파벳을 한글로 합성한다.")
    func convert1() {
        #expect(Hangul.convertQWERTYToHangul("abc") == "뮻")
        #expect(Hangul.convertQWERTYToHangul("dkdldhdptm") == "아이오에스")
        #expect(Hangul.convertQWERTYToHangul("vmfhsxmdpsem") == "프론트엔드")
    }
    
    @Test("쌍/자모음에 대응하지 않는 영어 알파벳을 한글로 합성한다.")
    func convert2() {
        #expect(Hangul.convertQWERTYToHangul("ABC") == "뮻")
        #expect(Hangul.convertQWERTYToHangul("DKDLDHDptM") == "아이오에스")
        #expect(Hangul.convertQWERTYToHangul("VMFHSXM") == "프론트")
    }

    @Test("영어 알파벳은 한글로 합성하고, 한글 음절은 유지한다.")
    func convert3() {
        #expect(Hangul.convertQWERTYToHangul("dkdl오에스") == "아이오에스")
        #expect(Hangul.convertQWERTYToHangul("vm론트") == "프론트")
    }
    
    @Test("인자가 한글 음소면 한글로 합성한다.")
    func convert4() {
        #expect(Hangul.convertQWERTYToHangul("ㅇㅏㅇㅣㅇㅗㅇㅔㅅㅡ") == "아이오에스")
        #expect(Hangul.convertQWERTYToHangul("ㅍㅡㄹㅗㄴㅌㅡ") == "프론트")
    }
    
    @Test("영문 대문자는 쌍자/모음에 대응하며 한글로 합성한다.")
    func convert5() {
        #expect(Hangul.convertQWERTYToHangul("RㅏㄱEㅜrl") == "깍뚜기")
        #expect(Hangul.convertQWERTYToHangul("ㅇPdml") == "예의")
    }
    
    @Test("빈 문자열은 빈 문자열을 반환한다.")
    func convert6() {
        #expect(Hangul.convertQWERTYToHangul("") == "")
    }
}
