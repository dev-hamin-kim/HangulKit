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
    
    // MARK: disassembleToGroups가 애초에 1차원 배열을 리턴하게 해서 시간 복잡도를 줄여볼 것.
    static func disassemble(_ word: String) -> [Character] {
        return disassembleToGroups(word).flatMap { $0 }
    }
}
