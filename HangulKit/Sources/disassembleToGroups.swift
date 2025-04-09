//
//  disassembleToGroups.swift
//  HangulKit
//
//  Created by 김하민 on 3/25/25.
//

public extension Hangul {
    
    static func disassembleToGroups(_ string: String) -> [[Character]] {
        var result: [[Character]] = []
        
        for char in string {
            guard isHangul(String(char)) else {
                result.append([char])
                continue
            }
            
//            guard Hangul.DisassembledVowels[char] == nil else {
//                continue
//            }
//            
//            if let char = Hangul.DisassembledConsonants[char] { }

            let disassembledCharacter = try? disassembleCompleteCharacter(char)
            
            guard let disassembledCharacter else {
                if let char = Hangul.DisassembledVowels[char] { result.append(char) }
                if let char = Hangul.DisassembledConsonants[char] { result.append(char) }
                continue
            }
            
            let choseong = disassembledCharacter.choseong
            let jungseong = disassembledCharacter.jungseong
            let decomposedJungseong = Hangul.DisassembledVowels[jungseong]
            
            var decomposedJamo: [Character] = [choseong]
            decomposedJamo.append(contentsOf: decomposedJungseong!)
            
            guard let jongseong = disassembledCharacter.jongseong else {
                result.append(decomposedJamo)
                continue
            }
            
            let decomposedJongseong = Hangul.DisassembledConsonants[jongseong]
            
            decomposedJamo.append(contentsOf: decomposedJongseong!)
            result.append(decomposedJamo)
        }
        
        return result
    }
}
