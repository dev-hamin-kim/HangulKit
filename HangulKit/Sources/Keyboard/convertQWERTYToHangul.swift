//
//  convertQWERTYToHangul.swift
//  HangulKit
//
//  Created by 김하민 on 4/10/25.
//

public extension Hangul {
    
    static func convertQWERTYToHangul(_ word: String) -> String {
        if word.isEmpty { return "" }
        
        return assemble(word.map { convertQWERTYToAlphabet(String($0)) }) // MARK: 이 줄의 비효율성을 고칠 것.
    }
}

