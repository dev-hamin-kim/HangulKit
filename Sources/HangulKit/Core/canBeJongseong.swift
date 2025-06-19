//
//  canBeJongseong.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

public extension HangulKit {
    
    /// 인자로 받은 문자가 종성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    /// ```swift
    /// HangulKit.canBeJongseong("ㄱ") // true
    /// HangulKit.canBeJongseong("ㄳ") // true
    /// HangulKit.canBeJongseong("ㅃ") // false
    /// HangulKit.canBeJongseong("가") // false
    /// HangulKit.canBeJongseong("ㅏ") // false
    /// HangulKit.canBeJongseong("ㅘ") // false
    /// ```
    static func canBeJongseong(_ character: Character?) -> Bool {
        return HangulKit.Jongseong.list.contains(character)
    }
}
