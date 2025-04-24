//
//  hasBatchim.swift
//  HangulKit
//
//  Created by 김하민 on 4/3/25.
//

public extension Hangul {
    
    enum Batchim {
        case single, double, both
    }
    
    static func hasBatchim(_ char: Character, _ batchimOption: Batchim = .both) -> Bool {
        
        guard isHangulCharacter(char) else { return false }
        
        let charCode = char.unicodeScalars.first!.value
        
        let batchimCode = Int(charCode - Hangul.CompleteHangulStartUnicodeScalar) % Hangul.Jongseong.count
        let batchim = Hangul.Jongseong.list[batchimCode]
        let batchimLength = Hangul.DisassembledConsonants[batchim]?.count
        
        switch batchimOption {
        case .single:
            return batchimLength == 1
        case .double:
            return batchimLength == 2
        case .both:
            return batchimCode > 0
        }
    }
}
