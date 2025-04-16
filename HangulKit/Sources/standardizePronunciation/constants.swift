//
//  constants.swift
//  HangulKit
//
//  Created by 김하민 on 4/15/25.
//

public extension Hangul {
    
    static let 음가가_없는_자음: Character = "ㅇ"
    static let 한글_자모 = ["기역", "니은", "리을", "미음", "비읍", "시옷", "이응"]
    static let 특별한_한글_자모 = ["디귿", "지읒", "치읓", "키읔", "티읕", "피읖", "히읗"]
    
    static let 특별한_한글_자모의_발음 [Character: Character] = [
        "ㄷ": "ㅅ",
        "ㅈ": "ㅅ",
        "ㅊ": "ㅅ",
        "ㅌ": "ㅅ",
        "ㅎ": "ㅅ",
        "ㅋ": "ㄱ",
        "ㅍ": "ㅂ",
    ]
    
    // 17항
    static let 음의_동화_받침: [Character: Character] = [
        "ㄷ": "ㅈ",
        "ㅌ": "ㅊ",
        "ㄾ": "ㅊ"
    ]
    
    // 'ㄴ,ㄹ'이 덧나는 동화작용
    static let ㄴㄹ이_덧나는_모음: Set<Character> = ["ㅏ", "ㅐ", "ㅓ", "ㅔ", "ㅗ", "ㅜ", "ㅟ"]
    static let ㄴㄹ이_덧나는_후속음절_모음: Set<Character> = ["ㅑ", "ㅕ", "ㅛ", "ㅠ", "ㅣ", "ㅒ", "ㅖ"]
    static let ㄴㄹ이_덧나서_받침_ㄴ_변환: Set<Character> = ["ㄱ", "ㄴ", "ㄷ", "ㅁ", "ㅂ", "ㅇ"]
    static let ㄴㄹ이_덧나서_받침_ㄹ_변환: Character = "ㄹ"
    
    // 19항
    static let 자음동화_받침_ㄴ_변환: Set<Character> = ["ㅁ", "ㅇ", "ㄱ", "ㅂ"]
    
    // 18항
    static let 비음화_받침_ㅇ_변환: Set<Character> = ["ㄱ", "ㄲ", "ㅋ", "ㄳ", "ㄺ"]
    static let 비음화_받침_ㄴ_변환: Set<Character> = ["ㄷ", "ㅅ", "ㅆ", "ㅈ", "ㅊ", "ㅌ", "ㅎ"]
    static let 비음화_받침_ㅁ_변환: Set<Character> = ["ㅂ", "ㅍ", "ㄼ", "ㄿ", "ㅄ"]
    
    // 12항
    static let 발음변환_받침_ㅎ: Set<Character> = ["ㅎ", "ㄶ", "ㅀ"]
    static let 발음변환_받침_ㅎ_발음: [Character: Character] = [
        "ㄱ": "ㅋ",
        "ㄷ": "ㅌ",
        "ㅈ": "ㅊ",
        "ㅅ": "ㅆ",
    ]
    
    static let 발음변환_첫소리_ㅎ: Set<Character> = ["ㄱ", "ㄺ", "ㄷ", "ㅂ", "ㄼ", "ㅈ", "ㄵ"]
    
    static let 발음변환_첫소리_ㅎ_발음: [Character: Character] = [
        "ㄱ": "ㅋ",
        "ㄺ": "ㅋ",
        "ㄷ": "ㅌ",
        "ㅂ": "ㅍ",
        "ㄼ": "ㅍ",
        "ㅈ": "ㅊ",
        "ㄵ": "ㅊ",
    ]
    
    // 9항, 10항, 11항
    static let 받침_대표음_발음: [Character: Character] = [
        "ㄲ": "ㄱ",
        "ㅋ": "ㄱ",
        "ㄳ": "ㄱ",
        "ㄺ": "ㄱ",
        "ㅅ": "ㄷ",
        "ㅆ": "ㄷ",
        "ㅈ": "ㄷ",
        "ㅊ": "ㄷ",
        "ㅌ": "ㄷ",
        "ㅍ": "ㅂ",
        "ㅄ": "ㅂ",
        "ㄿ": "ㅂ",
        "ㄵ": "ㄴ",
        "ㄼ": "ㄹ",
        "ㄽ": "ㄹ",
        "ㄾ": "ㄹ",
        "ㄻ": "ㅁ",
    ]
    
    static let 된소리: [Character: Character] = [
        "ㄱ": "ㄲ",
        "ㄷ": "ㄸ",
        "ㅂ": "ㅃ",
        "ㅅ": "ㅆ",
        "ㅈ": "ㅉ",
    ]
    
    // 23항
    static let 된소리_받침: Set<Character> = [
        "ㄱ",
        "ㄲ",
        "ㅋ",
        "ㄳ",
        "ㄺ",
        "ㄷ",
        "ㅅ",
        "ㅆ",
        "ㅈ",
        "ㅊ",
        "ㅌ",
        "ㅂ",
        "ㅍ",
        "ㄼ",
        "ㄿ",
        "ㅄ",
    ]
    
    // 24항, 25항
    static let 어간_받침: Set<Character> = ["ㄴ", "ㄵ", "ㅁ", "ㄻ", "ㄼ", "ㄾ"]
}
