//
//  assemble.swift
//  HangulKit
//
//  Created by 김하민 on 4/9/25.
//

public extension Hangul {
    
    static func assemble(_ fragments: [String]) -> String {
        // MARK: joined()가 느리다는 말이 있어서 나중에 벤치마크로 확인해볼 것.
        // https://forums.swift.org/t/why-joined-is-much-slower-than-flatmap/50190/4
        let disassembled: [Character] = disassemble(fragments.joined())
        
        return disassembled.reduce("") { binaryAssemble($0, $1) }
    }
}
