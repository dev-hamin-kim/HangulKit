//
//  convertHangulToQWERTY.swift
//  HangulKit
//
//  Created by 김하민 on 4/9/25.
//

public extension Hangul {
    
    static let hangulToQWERTYKeyboardMap: [Character: Character] = [
        "ㄱ": "r",
        "ㄲ": "R",
        "ㄴ": "s",
        "ㄷ": "e",
        "ㄸ": "E",
        "ㄹ": "f",
        "ㅁ": "a",
        "ㅂ": "q",
        "ㅃ": "Q",
        "ㅅ": "t",
        "ㅆ": "T",
        "ㅇ": "d",
        "ㅈ": "w",
        "ㅉ": "W",
        "ㅊ": "c",
        "ㅋ": "z",
        "ㅌ": "x",
        "ㅍ": "v",
        "ㅎ": "g",
        "ㅏ": "k",
        "ㅐ": "o",
        "ㅑ": "i",
        "ㅒ": "O",
        "ㅓ": "j",
        "ㅔ": "p",
        "ㅕ": "u",
        "ㅖ": "P",
        "ㅗ": "h",
        "ㅛ": "y",
        "ㅜ": "n",
        "ㅠ": "b",
        "ㅡ": "m",
        "ㅣ": "l",
    ]
    
    static func convertHangulToQWERTY(_ word: String) -> String {
        
        if word.isEmpty { return "" }
        
        let disassembledWord: [Character] = disassemble(word)
        
        let result = disassembledWord
            .map { hangulToQWERTYKeyboardMap[$0] ?? $0 }
        
        return String(result)
    }
}
