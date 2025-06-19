//
//  canBeChoseong.swift
//  HangulKit
//
//  Created by 김하민 on 3/18/25.
//

public extension HangulKit {
    
    /// 인자로 받은 문자가 초성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    /// ```swift
    /// HangulKit.canBeChoseong("ㄱ") // true
    /// HangulKit.canBeChoseong("ㅃ") // true
    /// HangulKit.canBeChoseong("ㄳ") // false
    /// HangulKit.canBeChoseong("ㅏ") // false
    /// HangulKit.canBeChoseong("가") // false
    /// ```
    static func canBeChoseong(_ character: Character) -> Bool {
        return HangulKit.Choseong.list.contains(character)
    }
}
