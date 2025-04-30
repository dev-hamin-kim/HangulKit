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
    
    /// 입력된 한글 문자가 받침이 있는지 확인합니다.
    ///
    ///     Hangul.hasBatchim("값") // true
    ///     Hangul.hasBatchim("토") // false
    ///     Hangul.hasBatchim("갑", .single) // true
    ///     Hangul.hasBatchim("값", .single) // false
    ///     Hangul.hasBatchim("값", .double) // true
    ///     Hangul.hasBatchim("토", .double) // false
    ///
    /// - Parameters:
    ///     - char: 받침이 있는지 확인할 한글 문자입니다.
    ///     - batchimOption: 기본값은 .both이며, 받침이 있을 경우 true를 반환합니다.
    ///         - .double: 겹받침 혹은 쌍받침이 있을 때만 true를 반환합니다. 홀받침의 경우 false를 반환합니다.
    ///         - .single: 홀받침이 있을 때만 true를 반환합니다. 겹받침 또는 쌍받침의 경우 false를 반환합니다.
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
