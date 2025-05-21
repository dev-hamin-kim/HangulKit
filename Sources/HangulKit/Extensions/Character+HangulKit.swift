//
//  Character+HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 4/30/25.
//

extension Character: HangulKitCompatible { }

// TODO: 테스트 코드 작성
extension HangulKitWrapper where Base == Character {
    /// 문자가 초성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    ///     "ㄱ".hk.canBeChoseong() // returns true
    ///     "ㅃ".hk.canBeChoseong() // returns true
    ///     "ㄳ".hk.canBeChoseong() // returns false
    ///     "ㅏ".hk.canBeChoseong() // returns false
    ///     "가".hk.canBeChoseong() // returns false
    public func canBeChoseong() -> Bool {
        return HangulKit.canBeChoseong(base)
    }
    
    /// 문자가 중성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    ///     "ㅘ".hk.canBeJungseong() // returns true
    ///     "ㅏ".hk.canBeJungseong() // returns true
    ///     "ㄱ".hk.canBeJungseong() // returns false
    ///     "ㄳ".hk.canBeJungseong() // returns false
    ///     "가".hk.canBeJungseong() // returns false
    public func canBeJungsung() -> Bool {
        return HangulKit.canBeJungseong(base)
    }
    
    /// 문자가 종성으로 위치할 수 있는 문자인지 검사합니다.
    ///
    ///     "ㄱ".hk.canBeJongseong() // returns true
    ///     "ㄳ".hk.canBeJongseong() // returns true
    ///     "ㅃ".hk.canBeJongseong() // returns false
    ///     "가".hk.canBeJongseong() // returns false
    ///     "ㅏ".hk.canBeJongseong() // returns false
    ///     "ㅘ".hk.canBeJongseong() // returns false
    public func canbeJongseong() -> Bool {
        return HangulKit.canBeJongseong(base)
    }
    
    /// 한글 문자가 받침이 있는지 확인합니다.
    /// 입력된 문자가 온전한 한글 문자가 아닐 경우 nil을 반환합니다.
    ///
    ///     "값".hk.hasBatchim() // returns Optional(true)
    ///     "토".hk.hasBatchim() // returns Optional(false)
    ///
    ///     "갑".hk.hasBatchim(.single) // returns Optional(true)
    ///     "값".hk.hasBatchim(.single) // returns Optional(false)
    ///
    ///     "값".hk.hasBatchim(.double) // returns Optional(true)
    ///     "토".hk.hasBatchim(.double) // returns Optional(false)
    ///
    ///     "d".hk.hasBatchim() // returns nil
    ///     "ㅘ".hk.hasBatchim() // also returns nil
    ///
    /// - Parameters:
    ///     - batchimOption: 기본값은 .both이며, 받침이 있을 경우 true를 반환합니다.
    ///         - .double: 겹받침 혹은 쌍받침이 있을 때만 true를 반환합니다. 홀받침의 경우 false를 반환합니다.
    ///         - .single: 홀받침이 있을 때만 true를 반환합니다. 겹받침 또는 쌍받침의 경우 false를 반환합니다.
    public func hasBatchim(_ batchimOption: HangulKit.Batchim = .both) -> Bool? {
        return HangulKit.hasBatchim(base, batchimOption)
    }
}
