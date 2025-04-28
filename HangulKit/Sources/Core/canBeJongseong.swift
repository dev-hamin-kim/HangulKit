//
//  canBeJongseong.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

public extension Hangul {
    
    /// 인자로 받은 문자가 종성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    ///     Hangul.canBeJongseong("ㄱ") // true
    ///     Hangul.canBeJongseong("ㄳ") // true
    ///     Hangul.canBeJongseong("ㅃ") // false
    ///     Hangul.canBeJongseong("가") // false
    ///     Hangul.canBeJongseong("ㅏ") // false
    ///     Hangul.canBeJongseong("ㅘ") // false
    ///
    static func canBeJongseong(_ character: Character?) -> Bool {
        return Hangul.Jongseong.list.contains(character)
    }
}
