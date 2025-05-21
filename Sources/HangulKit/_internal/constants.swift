//
//  constants.swift
//  HangulKit
//
//  Created by 김하민 on 5/21/25.
//

extension HangulKit {
    struct Choseong {
        /// 초성으로 올 수 있는 한글 글자
        static let list: [Character] = [
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
    }
    
    struct Jungseong {
        /// 중성으로 올 수 있는 한글 글자
        static let list: [Character] = [
            "ㅏ",
            "ㅐ",
            "ㅑ",
            "ㅒ",
            "ㅓ",
            "ㅔ",
            "ㅕ",
            "ㅖ",
            "ㅗ",
            "ㅘ",
            "ㅙ",
            "ㅚ",
            "ㅛ",
            "ㅜ",
            "ㅝ",
            "ㅞ",
            "ㅟ",
            "ㅠ",
            "ㅡ",
            "ㅢ",
            "ㅣ",
        ]
    }
    
    struct Jongseong {
        /// 종성으로 올 수 있는 한글 글자
        static let list: [Character?] = [
            nil,
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
        ]
    }
    
    static let JasoHangulNFD = "각힣".precomposedStringWithCanonicalMapping.unicodeScalars.map { String($0) }
    
    static let CompleteHangulStartUnicodeScalar = "가".unicodeScalars.first!.value
    static let CompleteHangulEndUnicodeScalar = "힣".unicodeScalars.first!.value
    
    static let NumberOfJongseong: UInt32 = 28
    static let NumberOfJungseong: UInt32 = 21
    
    // 기존 es-hangul에서는 DISASSEMBLED_CONSONANTS_BY_CONSONANT라는 명칭을 사용하나,
    // DISASSEMBLED_CONSONANTS만 적더라도 충분히 의미가 전달된다 판단됨.
    // (한글을 사용하는 사람이라면 자,모음이 결합된다는 규칙을 익히 알고 있기 때문에...)
    static let DisassembledConsonants: [Character?: [Character]] = [
        // (from es-hangul) 종성이 없는 경우 '빈' 초성으로 관리하는 것이 편리하여, 빈 문자열도 포함한다.
        nil: [],
        "ㄱ": ["ㄱ"],
        "ㄲ": ["ㄲ"],
        "ㄳ": ["ㄱ", "ㅅ"],
        "ㄴ": ["ㄴ"],
        "ㄵ": ["ㄴ", "ㅈ"],
        "ㄶ": ["ㄴ", "ㅎ"],
        "ㄷ": ["ㄷ"],
        "ㄸ": ["ㄸ"],
        "ㄹ": ["ㄹ"],
        "ㄺ": ["ㄹ", "ㄱ"],
        "ㄻ": ["ㄹ", "ㅁ"],
        "ㄼ": ["ㄹ", "ㅂ"],
        "ㄽ": ["ㄹ", "ㅅ"],
        "ㄾ": ["ㄹ", "ㅌ"],
        "ㄿ": ["ㄹ", "ㅍ"],
        "ㅀ": ["ㄹ", "ㅎ"],
        "ㅁ": ["ㅁ"],
        "ㅂ": ["ㅂ"],
        "ㅃ": ["ㅃ"],
        "ㅄ": ["ㅂ", "ㅅ"],
        "ㅅ": ["ㅅ"],
        "ㅆ": ["ㅆ"],
        "ㅇ": ["ㅇ"],
        "ㅈ": ["ㅈ"],
        "ㅉ": ["ㅉ"],
        "ㅊ": ["ㅊ"],
        "ㅋ": ["ㅋ"],
        "ㅌ": ["ㅌ"],
        "ㅍ": ["ㅍ"],
        "ㅎ": ["ㅎ"],
    ]
    
    static let DisassembledVowels: [Character: [Character]] = [
        "ㅏ": ["ㅏ"],
        "ㅐ": ["ㅐ"],
        "ㅑ": ["ㅑ"],
        "ㅒ": ["ㅒ"],
        "ㅓ": ["ㅓ"],
        "ㅔ": ["ㅔ"],
        "ㅕ": ["ㅕ"],
        "ㅖ": ["ㅖ"],
        "ㅗ": ["ㅗ"],
        "ㅘ": ["ㅗ", "ㅏ"],
        "ㅙ": ["ㅗ", "ㅐ"],
        "ㅚ": ["ㅗ", "ㅣ"],
        "ㅛ": ["ㅛ"],
        "ㅜ": ["ㅜ"],
        "ㅝ": ["ㅜ", "ㅓ"],
        "ㅞ": ["ㅜ", "ㅔ"],
        "ㅟ": ["ㅜ", "ㅣ"],
        "ㅠ": ["ㅠ"],
        "ㅡ": ["ㅡ"],
        "ㅢ": ["ㅡ", "ㅣ"],
        "ㅣ": ["ㅣ"],
    ]
    
    static let assembledVowels: [String: Character] = [
        "ㅏ": "ㅏ",
        "ㅐ": "ㅐ",
        "ㅑ": "ㅑ",
        "ㅒ": "ㅒ",
        "ㅓ": "ㅓ",
        "ㅔ": "ㅔ",
        "ㅕ": "ㅕ",
        "ㅖ": "ㅖ",
        "ㅗ": "ㅗ",
        "ㅗㅏ": "ㅘ",
        "ㅗㅐ": "ㅙ",
        "ㅗㅣ": "ㅚ",
        "ㅛ": "ㅛ",
        "ㅜ": "ㅜ",
        "ㅜㅓ": "ㅝ",
        "ㅜㅔ": "ㅞ",
        "ㅜㅣ": "ㅟ",
        "ㅠ": "ㅠ",
        "ㅡ": "ㅡ",
        "ㅡㅣ": "ㅢ",
        "ㅣ": "ㅣ",
    ]
    
    static let assembledConsonants: [String: Character] = [
        "ㄱ": "ㄱ",
        "ㄲ": "ㄲ",
        "ㄱㅅ": "ㄳ",
        "ㄴ": "ㄴ",
        "ㄴㅈ": "ㄵ",
        "ㄴㅎ": "ㄶ",
        "ㄷ": "ㄷ",
        "ㄸ": "ㄸ",
        "ㄹ": "ㄹ",
        "ㄹㄱ": "ㄺ",
        "ㄹㅁ": "ㄻ",
        "ㄹㅂ": "ㄼ",
        "ㄹㅅ": "ㄽ",
        "ㄹㅌ": "ㄾ",
        "ㄹㅍ": "ㄿ",
        "ㄹㅎ": "ㅀ",
        "ㅁ": "ㅁ",
        "ㅂ": "ㅂ",
        "ㅃ": "ㅃ",
        "ㅂㅅ": "ㅄ",
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
    
    
    static let Digits = [
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
    
    static let DigitsMax = Digits.count * 4
    
    static let Numbers = ["", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
    static let NumbersForDecimal = ["영", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
    static let Cardinal = ["", "십", "백", "천"]
}
