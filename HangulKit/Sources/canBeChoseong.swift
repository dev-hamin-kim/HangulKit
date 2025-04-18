//
//  canBeChoseong.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

public extension Hangul {
    
    /// 인자로 받은 문자가 초성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    ///```
    /// canBeChoseong('ㄱ') // true
    /// canBeChoseong('ㅃ') // true
    /// canBeChoseong('ㄱㅅ') // false
    /// canBeChoseong('ㅏ') // false
    /// canBeChoseong('가') // false
    /// ```
    static func canBeChoseong(_ character: Character) -> Bool {
        return Hangul.Choseong.list.contains(character)
    }
}
