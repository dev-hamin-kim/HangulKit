//
//  romanize.swift
//  HangulKit
//
//  Created by 김하민 on 4/15/25.
//

public extension Hangul {
    
    static let 중성_알파벳_발음: [Character: String] = [
        // MARK: - 단모음
        "ㅏ": "a",
        "ㅓ": "eo",
        "ㅗ": "o",
        "ㅜ": "u",
        "ㅡ": "eu",
        "ㅣ": "i",
        "ㅐ": "ae",
        "ㅔ": "e",
        "ㅚ": "oe",
        "ㅟ": "wi",
        // MARK: - 이중모음
        "ㅑ": "ya",
        "ㅕ": "yeo",
        "ㅛ": "yo",
        "ㅠ": "yu",
        "ㅒ": "yae",
        "ㅖ": "ye",
        "ㅘ": "wa",
        "ㅙ": "wae",
        "ㅝ": "wo",
        "ㅞ": "we",
        "ㅢ": "ui",
    ]
    
    static let 초성_알파벳_발음: [Character: String] = [
        // MARK: - 파열음
        "ㄱ": "g",
        "ㄲ": "kk",
        "ㅋ": "k",
        "ㄷ": "d",
        "ㄸ": "tt",
        "ㅌ": "t",
        "ㅂ": "b",
        "ㅃ": "pp",
        "ㅍ": "p",
        // MARK: - 파찰음
        "ㅈ": "j",
        "ㅉ": "jj",
        "ㅊ": "ch",
        // MARK: - 마찰음
        "ㅅ": "s",
        "ㅆ": "ss",
        "ㅎ": "h",
        // MARK: - 비음
        "ㄴ": "n",
        "ㅁ": "m",
        "ㅇ": "",
        // MARK: - 유음
        "ㄹ": "r",
    ]
    
    static let 종성_알파벳_발음: [Character?: String] = [
        "ㄱ": "k",
        "ㄴ": "n",
        "ㄷ": "t",
        "ㄹ": "l",
        "ㅁ": "m",
        "ㅂ": "p",
        "ㅇ": "ng",
        nil: "",
    ]
    
    
}
