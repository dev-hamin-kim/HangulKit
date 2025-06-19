//
//  canBeJungseong.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

public extension HangulKit {
    
    /// 인자로 받은 문자가 중성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    /// ```swift
    /// HangulKit.canBeJungseong("ㅘ") // true
    /// HangulKit.canBeJungseong("ㅏ") // true
    /// HangulKit.canBeJungseong("ㄱ") // false
    /// HangulKit.canBeJungseong("ㄳ") // false
    /// HangulKit.canBeJungseong("가") // false
    /// ```
    static func canBeJungseong(_ character: Character) -> Bool {
        return HangulKit.Jungseong.list.contains(character)
    }
}
