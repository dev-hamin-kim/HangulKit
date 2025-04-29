//
//  convertQWERTYToHangul.swift
//  HangulKit
//
//  Created by 김하민 on 4/10/25.
//

public extension Hangul {
    
    /// QWERTY 자판에서 입력된 영어 알파벳을 동일한 위치의 두벌식 자판에 해당하는 한글 음소로 변환한 후 온전한 한글 문자와 문장으로 변환합니다.
    ///
    ///     Hangul.convertQWERTYToHangul("abc") // returns "뮻"
    ///     Hangul.convertQWERTYToHangul("ABC") // also returns "뮻"
    ///     Hangul.convertQWERTYToHangul("dkdldhdptm") // returns "아이오에스"
    ///     Hangul.convertQWERTYToHangul("dkdl오에스") // also returns "아이오에스"
    static func convertQWERTYToHangul(_ word: String) -> String {
        if word.isEmpty { return "" }
        
        var result: [Character] = []
        
        word.forEach { result.append(convertQWERTYToAlphabet($0)) }
        
        return assemble(result)
    }
}

