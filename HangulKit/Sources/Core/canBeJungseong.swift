//
//  canBeJungseong.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

public extension Hangul {
    
    /// 인자로 받은 문자가 중성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    ///     Hangul.canBeJungseong("ㅘ") // true
    ///     Hangul.canBeJungseong("ㅏ") // true
    ///     Hangul.canBeJungseong("ㄱ") // false
    ///     Hangul.canBeJungseong("ㄳ") // false
    ///     Hangul.canBeJungseong("가") // false
    ///
    static func canBeJungseong(_ character: Character) -> Bool {
        return Hangul.Jungseong.list.contains(character)
    }
}
