//
//  disassemble.swift
//  HangulKit
//
//  Created by 김하민 on 3/28/25.
//

public extension HangulKit {
    
    static func disassemble(_ word: String) -> String {
        return String(disassembleToGroups(word))
    }
    
    static func disassemble(_ word: String) -> [Character] {
        return disassembleToGroups(word)
    }
}
