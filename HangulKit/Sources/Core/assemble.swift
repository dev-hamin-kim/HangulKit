//
//  assemble.swift
//  HangulKit
//
//  Created by 김하민 on 4/9/25.
//

public extension Hangul {
    /// 인자로 받은 배열에 담긴 한글 문장과 문자를 한글 규칙에 맞게 합성합니다.
    ///
    ///     var 아버지가 = Hangul.assemble(["아버지가", " ", "방ㅇ", "ㅔ ", 들ㅇ", "ㅓ갑니다"])
    ///     print(아버지가) // prints "아버지가 방에 들어갑니다"
    ///
    ///     아버지가 = Hangul.assemble(["아버지가", " ", "방에 ", "들어갑니다"])
    ///     print(아버지가) // also prints "아버지가 방에 들어갑니다"
    ///
    ///     let 아버지 = Hangul.assemble(["ㅇ", "ㅏ", "ㅂ", "ㅓ", "ㅈ", "ㅣ"])
    ///     print(아버지) // prints "아버지"
    ///
    /// - Parameters:
    ///     - fragments: 한글 문자와 문장을 담고 있는 배열
    ///
    static func assemble(_ fragments: [String]) -> String {
        // MARK: joined()가 느리다는 말이 있어서 나중에 벤치마크로 확인해볼 것.
        // https://forums.swift.org/t/why-joined-is-much-slower-than-flatmap/50190/4
        let disassembled: [Character] = disassemble(fragments.joined())
        
        return disassembled.reduce("") { binaryAssemble($0, $1) }
    }
}
