//
//  Constants.swift
//
//
//  Created by 김하민 on 3/10/25.
//

import Foundation

public struct Constants {
    static let JasoHangulNFD = "각힣".precomposedStringWithCanonicalMapping.unicodeScalars.map { String($0) }
    
    static let CompleteHangulStartUnicodeScalar = "가".unicodeScalars.first!.value
    static let CompleteHangulEndUnicodeScalar = "힣".unicodeScalars.first!.value
    
    static let NumberOfJongseong = 28
    static let NumberOfJungseong = 21
    
    // 기존 es-hangul에서는 DISASSEMBLED_CONSONANTS_BY_CONSONANT라는 명칭을 사용하나,
    // DISASSEMBLED_CONSONANTS만 적더라도 충분히 의미가 전달된다 판단됨.
    // (한글을 사용하는 사람이라면 자,모음이 결합된다는 규칙을 익히 알고 있기 때문에...)
    static let DisassembledConsonants: [String: String] = [
        // (from es-hangul) 종성이 없는 경우 '빈' 초성으로 관리하는 것이 편리하여, 빈 문자열도 포함한다.
        "": "",
        "ㄱ": "ㄱ",
        "ㄲ": "ㄲ",
        "ㄳ": "ㄱㅅ",
        "ㄴ": "ㄴ",
        "ㄵ": "ㄴㅈ",
        "ㄶ": "ㄴㅎ",
        "ㄷ": "ㄷ",
        "ㄸ": "ㄸ",
        "ㄹ": "ㄹ",
        "ㄺ": "ㄹㄱ",
        "ㄻ": "ㄹㅁ",
        "ㄼ": "ㄹㅂ",
        "ㄽ": "ㄹㅅ",
        "ㄾ": "ㄹㅌ",
        "ㄿ": "ㄹㅍ",
        "ㅀ": "ㄹㅎ",
        "ㅁ": "ㅁ",
        "ㅂ": "ㅂ",
        "ㅃ": "ㅃ",
        "ㅄ": "ㅂㅅ",
        "ㅅ": "ㅅ",
        "ㅆ": "ㅆ",
        "ㅇ": "ㅇ",
        "ㅈ": "ㅈ",
        "ㅉ": "ㅉ",
        "ㅊ": "ㅊ",
        "ㅋ": "ㅋ",
        "ㅌ": "ㅌ",
        "ㅍ": "ㅍ",
        "ㅎ": "ㅎ",
    ]
    
    static let DisassembledVowels: [String: String] = [
        "ㅏ": "ㅏ",
        "ㅐ": "ㅐ",
        "ㅑ": "ㅑ",
        "ㅒ": "ㅒ",
        "ㅓ": "ㅓ",
        "ㅔ": "ㅔ",
        "ㅕ": "ㅕ",
        "ㅖ": "ㅖ",
        "ㅗ": "ㅗ",
        "ㅘ": "ㅗㅏ",
        "ㅙ": "ㅗㅐ",
        "ㅚ": "ㅗㅣ",
        "ㅛ": "ㅛ",
        "ㅜ": "ㅜ",
        "ㅝ": "ㅜㅓ",
        "ㅞ": "ㅜㅔ",
        "ㅟ": "ㅜㅣ",
        "ㅠ": "ㅠ",
        "ㅡ": "ㅡ",
        "ㅢ": "ㅡㅣ",
        "ㅣ": "ㅣ",
    ]
    
    /// 초성으로 올 수 있는 한글 글자
    static let Choseongs = [
        "ㄱ",
        "ㄲ",
        "ㄴ",
        "ㄷ",
        "ㄸ",
        "ㄹ",
        "ㅁ",
        "ㅂ",
        "ㅃ",
        "ㅅ",
        "ㅆ",
        "ㅇ",
        "ㅈ",
        "ㅉ",
        "ㅊ",
        "ㅋ",
        "ㅌ",
        "ㅍ",
        "ㅎ",
    ]
    
    /// 중성으로 올 수 있는 한글 글자
    static let Jungseongs = DisassembledVowels.values
    
    /// 종성으로 올 수 있는 한글 글자
    static let Jongseongs = [
        "",
        "ㄱ",
        "ㄲ",
        "ㄳ",
        "ㄴ",
        "ㄵ",
        "ㄶ",
        "ㄷ",
        "ㄹ",
        "ㄺ",
        "ㄻ",
        "ㄼ",
        "ㄽ",
        "ㄾ",
        "ㄿ",
        "ㅀ",
        "ㅁ",
        "ㅂ",
        "ㅄ",
        "ㅅ",
        "ㅆ",
        "ㅇ",
        "ㅈ",
        "ㅊ",
        "ㅋ",
        "ㅌ",
        "ㅍ",
        "ㅎ",
    ].map { DisassembledConsonants[$0] }
    
    static let HangulDigits = [
        "",
        "만",
        "억",
        "조",
        "경",
        "해",
        "자",
        "양",
        "구",
        "간",
        "정",
        "재",
        "극",
        "항하사",
        "아승기",
        "나유타",
        "불가사의",
        "무량대수",
        "겁",
        "업",
    ]
    
    static let HangulDigitsMax = HangulDigits.count * 4
    
    static let HangulNumbers = ["", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
    static let HangulNumbersForDecimal = ["영", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
    static let HangulCardinal = ["", "십", "백", "천"]
}


