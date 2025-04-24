//
//  getChoseong.swift
//  HangulKit
//
//  Created by 김하민 on 4/11/25.
//

public extension Hangul {
    
    static func getChoseong(_ word: String) -> String {
        
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
        
            let value = char.unicodeScalars.first!.value - Hangul.CompleteHangulStartUnicodeScalar
            
            let index = Int(value / 588)
            
            result.append(Hangul.Choseong.list[index])

        }
        
        return result
    }
}
