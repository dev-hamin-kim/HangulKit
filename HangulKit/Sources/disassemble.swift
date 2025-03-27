//
//  disassemble.swift
//  HangulKit
//
//  Created by 김하민 on 3/28/25.
//

public extension Hangul {
    
    static func disassemble(_ word: String) -> String {
        return disassembleToGroups(word).reduce(into: "") { $0 += $1 }
    }
}
