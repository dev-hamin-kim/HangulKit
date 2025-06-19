//
//  getChoseong.swift
//  HangulKit
//
//  Created by 김하민 on 4/11/25.
//

public extension HangulKit {
    
    /// 단어에서 초성을 추출합니다.
    /// 한글 단어가 아닐 경우 nil을 반환합니다.
    ///
    /// ```swift
    /// let apple = HangulKit.getChoseong(of: "사과")
    /// print(apple) // prints Optional("ㅅㄱ")
    ///
    /// let spacing = HangulKit.getChoseong(of: "띄어 쓰기")
    /// print(spacing) // prints Optional("ㄸㅇ ㅆㄱ")
    ///
    /// let english = HangulKit.getChoseong(of: "english")
    /// print(english) // prints nil
    /// ```
    ///
    /// - Parameters:
    ///     - word: 초성을 추출할 단어
    static func getChoseong(of word: String) -> String? {
        guard isHangul(word) else { return nil }
        
        var result = ""
        
        for char in word {
            let choseong = getChoseong(char) ?? " "
            result.append(choseong)
        }
        
        return result
    }
    
    static private func getChoseong(_ char: Character) -> Character? {
        guard isHangulAlphabet(char) || isHangulCharacter(char) else { return nil }
        
        if canBeChoseong(char) { return char }
        
        let value = char.unicodeScalars.first!.value - HangulKit.CompleteHangulStartUnicodeScalar
        
        let index = Int(value / 588)
        
        return HangulKit.Choseong.list[index]
    }
}
