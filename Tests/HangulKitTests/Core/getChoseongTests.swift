//
//  getChoseongTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/11/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct getChoseongTests {
    
    @Test("'사과' 단어에서 초성 'ㅅㄱ'을 추출한다.")
    func getChoseong1() {
        #expect(HangulKit.getChoseong(of: "사과") == "ㅅㄱ")
    }
    
    @Test("'아이오에스' 단어에서 초성 'ㅇㅇㅇㅇㅅ'를 추출한다.")
    func getChoseong2() {
        #expect(HangulKit.getChoseong(of: "아이오에스") == "ㅇㅇㅇㅇㅅ")
    }
    
    @Test("'프론트엔드' 문자에서 초성 'ㅍㄹㅌㅇㄷ'를 추출한다.")
    func getChoseong3() {
        #expect(HangulKit.getChoseong(of: "프론트엔드") == "ㅍㄹㅌㅇㄷ")
    }
    
    @Test("'ㄴㅈ' 문자에서 초성 'ㄴㅈ'를 추출한다.")
    func getChoseong4() {
        #expect(HangulKit.getChoseong(of: "ㄴㅈ") == "ㄴㅈ")
    }
    
    @Test("'유아이킷' 단어에서 초성 'ㅇㅇㅇㅋ'를 추출한다.")
    func getChoseong5() {
        #expect(HangulKit.getChoseong(of: "유아이킷") == "ㅇㅇㅇㅋ")
    }
    
    @Test("'리액트' 단어에서 초성 'ㄹㅇㅌ'를 추출한다.")
    func getChoseong6() {
        #expect(HangulKit.getChoseong(of: "리액트") == "ㄹㅇㅌ")
    }
    
    @Test("'띄어 쓰기' 단어에서 초성 'ㄸㅇ ㅆㄱ'를 추출한다.")
    func getChoseong7() {
        #expect(HangulKit.getChoseong(of: "띄어 쓰기") == "ㄸㅇ ㅆㄱ")
    }
    
    @Test("한글 단어가 아닐 경우 nil을 반환한다.")
    func getChoseong8() {
        #expect(HangulKit.getChoseong(of: "english") == nil)
    }

}

#endif
