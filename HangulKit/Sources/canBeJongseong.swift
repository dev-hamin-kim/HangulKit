//
//  canBeJongseong.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

public extension Hangul {
    
    /// 인자로 받은 문자가 종성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    ///```
    /// canBeJongseong('ㄱ') // true
    /// canBeJongseong('ㄱㅅ') // true
    /// canBeJongseong('ㅎㄹ') // false
    /// canBeJongseong('가') // false
    /// canBeJongseong('ㅏ') // false
    /// canBeJongseong('ㅗㅏ') // false
    ///
    ///
    static func canBeJongseong(_ string: String) -> Bool {
        return Hangul.Jongseong.list.contains(string)
    }
}
