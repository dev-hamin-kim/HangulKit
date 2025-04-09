//
//  convertQWERTYToAlphabet.swift
//  HangulKit
//
//  Created by 김하민 on 4/10/25.
//

public extension Hangul {
    
    static let qwertyKeyboardMap: [Character: Character] = [
        "q": "ㅂ",
        "Q": "ㅃ",
        "w": "ㅈ",
        "W": "ㅉ",
        "e": "ㄷ",
        "E": "ㄸ",
        "r": "ㄱ",
        "R": "ㄲ",
        "t": "ㅅ",
        "T": "ㅆ",
        "y": "ㅛ",
        "Y": "ㅛ",
        "u": "ㅕ",
        "U": "ㅕ",
        "i": "ㅑ",
        "I": "ㅑ",
        "o": "ㅐ",
        "O": "ㅒ",
        "p": "ㅔ",
        "P": "ㅖ",
        "a": "ㅁ",
        "A": "ㅁ",
        "s": "ㄴ",
        "S": "ㄴ",
        "d": "ㅇ",
        "D": "ㅇ",
        "f": "ㄹ",
        "F": "ㄹ",
        "g": "ㅎ",
        "G": "ㅎ",
        "h": "ㅗ",
        "H": "ㅗ",
        "j": "ㅓ",
        "J": "ㅓ",
        "k": "ㅏ",
        "K": "ㅏ",
        "l": "ㅣ",
        "L": "ㅣ",
        "z": "ㅋ",
        "Z": "ㅋ",
        "x": "ㅌ",
        "X": "ㅌ",
        "c": "ㅊ",
        "C": "ㅊ",
        "v": "ㅍ",
        "V": "ㅍ",
        "b": "ㅠ",
        "B": "ㅠ",
        "n": "ㅜ",
        "N": "ㅜ",
        "m": "ㅡ",
        "M": "ㅡ",
    ]
    
    static func convertQWERTYToAlphabet(_ word: String) -> String {
        if word.isEmpty { return "" }
        
        let result = word
            .map { qwertyKeyboardMap[$0] ?? $0 }
        
        return String(result)
    }
}
