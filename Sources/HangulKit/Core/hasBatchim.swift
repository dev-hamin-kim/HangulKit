//
//  hasBatchim.swift
//  HangulKit
//
//  Created by 김하민 on 4/3/25.
//

public extension HangulKit {
    
    enum Batchim {
        case single, double, both
    }
    
    /// 입력된 한글 문자가 받침이 있는지 확인합니다.
    /// 입력된 문자가 온전한 한글 문자가 아닐 경우 nil을 반환합니다.
    ///
    ///     HangulKit.hasBatchim("값") // returns Optional(true)
    ///     HangulKit.hasBatchim("토") // returns Optional(false)
    ///
    ///     HangulKit.hasBatchim("갑", .single) // returns Optional(true)
    ///     HangulKit.hasBatchim("값", .single) // returns Optional(false)
    ///
    ///     HangulKit.hasBatchim("값", .double) // returns Optional(true)
    ///     HangulKit.hasBatchim("토", .double) // returns Optional(false)
    ///
    ///     HangulKit.hasBatchim("d") // returns nil
    ///     HangulKit.hasBatchim("ㅘ") // also returns nil
    ///
    /// - Parameters:
    ///     - char: 받침이 있는지 확인할 한글 문자입니다.
    ///     - batchimOption: 기본값은 .both이며, 받침이 있을 경우 Optional(true)를 반환합니다.
    ///         - .double: 겹받침 혹은 쌍받침이 있을 때만 Optional(true)를 반환합니다. 홀받침의 경우 Optional(false)를 반환합니다.
    ///         - .single: 홀받침이 있을 때만 Optional(true)를 반환합니다. 겹받침 또는 쌍받침의 경우 Optional(false)를 반환합니다.
    static func hasBatchim(_ char: Character, _ batchimOption: Batchim = .both) -> Bool? {
        guard isHangulCharacter(char) else { return nil }
        
        let charCode = char.unicodeScalars.first!.value
        
        let batchimCode = Int(charCode - HangulKit.CompleteHangulStartUnicodeScalar) % HangulKit.Jongseong.list.count
        let batchim = HangulKit.Jongseong.list[batchimCode]
        let batchimLength = HangulKit.DisassembledConsonants[batchim]?.count
        
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
