//
//  getChoseong.swift
//  HangulKit
//
//  Created by 김하민 on 4/11/25.
//

public extension HangulKit {
    
    /// 단어에서 초성을 추출합니다.
    ///
    ///     let apple = HangulKit.getChoseong(of: "사과")
    ///     print(apple) // prints "ㅅㄱ"
    ///
    ///     let spacing = HangulKit.getChoseong(of: "띄어 쓰기")
    ///     print(spacing) // prints "ㄸㅇ ㅆㄱ"
    ///
    /// - Parameters:
    ///     - word: 초성을 추출할 단어
    static func getChoseong(of word: String) -> String {
        
        guard isHangul(word) else { return word }
        
        var result = ""
        
        for char in word {
            guard isHangulAlphabet(char) || isHangulCharacter(char) else {
                result.append(char)
                continue
            }
            
            if canBeChoseong(char) {
                result.append(char)
                continue
            }
        
            let value = char.unicodeScalars.first!.value - HangulKit.CompleteHangulStartUnicodeScalar
            
            let index = Int(value / 588)
            
            result.append(HangulKit.Choseong.list[index])

        }
        
        return result
    }
}
