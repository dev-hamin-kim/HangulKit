//
//  convertHangulToQWERTY.swift
//  HangulKit
//
//  Created by 김하민 on 4/9/25.
//

public extension HangulKit {
    
    static internal let hangulToQWERTYKeyboardMap: [Character: Character] = [
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
    
    /// 두벌식 한글 자판에서 입력된 한글을 QWERTY 자판과 매칭되는 영어 알파벳으로 변환합니다.
    ///
    ///     HangulKit.convertHangulToQwerty("겨노"); // returns "rush"
    ///     HangulKit.convertHangulToQwerty("쨰ㅉ"); // returns "WOW"
    ///     HangulKit.convertHangulToQwerty("iOS개발!"); // returns "iOSroqkf!"
    ///     HangulKit.convertHangulToQwerty("ㅇPdml"); // returns "dPdml"
    ///     HangulKit.convertHangulToQwerty(""); // returns ""
    static func convertHangulToQWERTY(_ word: String) -> String {
        
        if word.isEmpty { return "" }
        
        let disassembledWord: [Character] = disassemble(word)
        
        let result = disassembledWord
            .map { hangulToQWERTYKeyboardMap[$0] ?? $0 }
        
        return String(result)
    }
}
