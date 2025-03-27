//
//  canBeJungseong.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

public extension Hangul {
    
    /// 인자로 받은 문자가 중성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    ///```
    /// canBeJungseong('ㅏ') // true
    /// canBeJungseong('ㅗㅏ') // true
    /// canBeJungseong('ㅏㅗ') // false
    /// canBeJungseong('ㄱ') // false
    /// canBeJungseong('ㄱㅅ') // false
    /// canBeJungseong('가') // false
    ///
    static func canBeJungseong(_ character: Character) -> Bool {
        return Hangul.Jungseong.list.contains(character)
    }
}
