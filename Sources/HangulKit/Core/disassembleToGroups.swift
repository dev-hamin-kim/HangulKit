//
//  disassembleToGroups.swift
//  HangulKit
//
//  Created by 김하민 on 3/25/25.
//

public extension HangulKit {
    
    static func disassembleToGroups(_ string: String) -> [[Character]] {
        var result: [[Character]] = []
        
        for char in string {
            guard isHangul(String(char)) else {
                result.append([char])
                continue
            }

            let disassembledCharacter = disassembleCompleteCharacter(char)
            
            guard let disassembledCharacter else {
                if let char = HangulKit.DisassembledVowels[char] { result.append(char) }
                if let char = HangulKit.DisassembledConsonants[char] { result.append(char) }
                continue
            }
            
            let choseong = disassembledCharacter.choseong
            let jungseong = disassembledCharacter.jungseong
            let decomposedJungseong = HangulKit.DisassembledVowels[jungseong]
            
            var decomposedJamo: [Character] = [choseong]
            decomposedJamo.append(contentsOf: decomposedJungseong!)
            
            guard let jongseong = disassembledCharacter.jongseong else {
                result.append(decomposedJamo)
                continue
            }
            
            let decomposedJongseong = HangulKit.DisassembledConsonants[jongseong]
            
            decomposedJamo.append(contentsOf: decomposedJongseong!)
            result.append(decomposedJamo)
        }
        
        return result
    }
    
    /// 메서드 ``disassembleToGroups(_:)``와 동일 하지만, 2차원 배열이 아닌 1차원 배열으로 리턴함.
    ///
    /// ``disassemble(_:)`` 사용 시 flatMap을 사용하지 않게 하기 위함.
    static func disassembleToGroups(_ string: String) -> [Character] {
        var result: [Character] = []
        
        for char in string {
            guard isHangul(String(char)) else {
                result.append(char)
                continue
            }
            
            let disassembledCharacter = disassembleCompleteCharacter(char)
            
            guard let disassembledCharacter else {
                if let char = HangulKit.DisassembledVowels[char] { result.append(contentsOf: char) }
                if let char = HangulKit.DisassembledConsonants[char] { result.append(contentsOf: char) }
                continue
            }
            
            let choseong = disassembledCharacter.choseong
            let jungseong = disassembledCharacter.jungseong
            let decomposedJungseong = HangulKit.DisassembledVowels[jungseong]
            
            var decomposedJamo: [Character] = [choseong]
            decomposedJamo.append(contentsOf: decomposedJungseong!)
            
            guard let jongseong = disassembledCharacter.jongseong else {
                result.append(contentsOf: decomposedJamo)
                continue
            }
            
            let decomposedJongseong = HangulKit.DisassembledConsonants[jongseong]
            
            decomposedJamo.append(contentsOf: decomposedJongseong!)
            result.append(contentsOf: decomposedJamo)
        }
        
        return result
    }
}
