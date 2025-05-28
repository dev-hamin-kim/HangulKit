//
//  Int+HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 5/2/25.
//

extension Int: HangulKitCompatible { }
extension Int8: HangulKitCompatible { }
extension Int16: HangulKitCompatible { }
extension Int32: HangulKitCompatible { }
extension Int64: HangulKitCompatible { }

extension UInt: HangulKitCompatible { }
extension UInt8: HangulKitCompatible { }
extension UInt16: HangulKitCompatible { }
extension UInt32: HangulKitCompatible { }
extension UInt64: HangulKitCompatible { }

// TODO: 테스트 코드 작성
extension HangulKitWrapper where Base == Int {
    /// 날짜를 나타내는 정수를 순 우리말 날짜로 변환해줍니다.
    /// 1부터 30까지의 정수가 아니라면 nil을 반환합니다.
    ///
    ///     1.hk.days() // returns Optional("하루")
    ///     3.hk.days() // returns Optional("사흘")
    ///     10.hk.days() // returns Optional("열흘")
    ///     30.hk.days() // returns Optional("서른날")
    ///
    ///     0.hk.days() // returns nil
    ///     31.hk.days() // also returns nil
    public func days() -> String? {
        return HangulKit.days(base)
    }
    
    /// 정수를 한글 서수사로 변환합니다.
    /// 0 이하의 정수는 nil을 반환합니다.
    ///
    ///     1.hk.seosusa() // returns Optional("첫째")
    ///     2.hk.seosusa() // returns Optional("둘째")
    ///     3.hk.seosusa() // returns Optional("셋째")
    ///     10.hk.seosusa() // returns Optional("열째")
    ///     11.hk.seosusa() // returns Optional("열한째")
    ///     12.hk.seosusa() // returns Optional("열두째")
    ///     13.hk.seosusa() // returns Optional("열셋째")
    ///     20.hk.seosusa() // returns Optional("스무째")
    ///     21.hk.seosusa() // returns Optional("스물한째")
    ///     30.hk.seosusa() // returns Optional("서른째")
    ///     40.hk.seosusa() // returns Optional("마흔째")
    ///     99.hk.seosusa() // returns Optional("아흔아홉째")
    ///     100.hk.seosusa() // returns Optional("백째")
    ///
    ///     0.hk.seosusa() // returns nil
    ///     -1.hk.seosusa() // also returns nil
    ///
    /// - Note:
    /// - `서수사`는 순서를 나타내는 단어입니다.
    /// - 1부터 99까지의 정수는 순우리말 서수사 문자열로 변환합니다.
    /// - 100 이상의 정수는 한자어 서수사 문자열로 변환합니다.
    public func seosusa() -> String? {
        return HangulKit.seosusa(of: base)
    }
    
    /// 정수를 순 우리말 순 우리말 수사로 변환합니다.
    /// 주어진 정수가 0보다 크고 100 이하일 때 유효하며, 범위를 벗어났을 경우, nil을 반환합니다.
    ///
    ///     1.hk.susa() // returns Optional("하나")
    ///     2.hk.susa() // returns Optional("둘")
    ///     11.hk.susa() // returns Optional("열하나")
    ///     21.hk.susa() // returns Optional("스물하나")
    ///     99.hk.susa() // returns Optional("아흔아홉")
    ///     100.hk.susa() // returns Optional("백")
    ///     1.hk.susa(classifier: true) // returns Optional("한")
    ///     2.hk.susa(classifier: true) // returns Optional("두")
    ///     11.hk.susa(classifier: true) // returns Optional("열한")
    ///     20.hk.susa(classifier: true) // returns Optional("스무")
    ///     21.hk.susa(classifier: true) // returns Optional("스물한")
    ///
    ///     0.hk.susa() // returns nil
    ///     101.hk.susa() // also returns nil
    ///
    /// - Parameters:
    ///     - classifier: 수관형사를 사용할지 여부를 입력합니다. 기본값은 false입니다.
    ///
    /// - Note:
    /// - `수사`란 숫자를 나타내는 우리말 단어입니다. [자세히 알아보기](https://ko.dict.naver.com/#/entry/koko/d0ce2b674cae4b44b9028f648dd458b0)
    /// - `수관형사`는 사물의 수나 양을 나타내는 관형사입니다. "두 사람"의 "두", "세 근"의 "세" 따위를 뜻합니다. [자세히 알아보기](https://ko.dict.naver.com/#/entry/koko/c513782b82554ff499c80ec616c5b611)
    public func susa(classifier: Bool = false) -> String? {
        return HangulKit.susa(of: base, classifier: classifier)
    }
}

extension HangulKitWrapper where Base: UnsignedInteger {
    // MARK: 주석 추가 필요
    public func numberToHangul(withSpacing: Bool = false) -> String {
        return HangulKit.numberToHangul(base, withSpacing: withSpacing)
    }
    
    // MARK: 주석 추가 필요
    public func numberToHangulMixed(withSpacing: Bool = false) -> String {
        return HangulKit.numberToHangulMixed(base, withSpacing: withSpacing)
    }
}

extension HangulKitWrapper where Base: SignedInteger {
    // MARK: 주석 추가 필요
    public func numberToHangul(withSpacing: Bool = false) -> String {
        return HangulKit.numberToHangul(base, withSpacing: withSpacing)
    }
    
    // MARK: 주석 추가 필요
    public func numberToHangulMixed(withSpacing: Bool = false) -> String {
        return HangulKit.numberToHangulMixed(base, withSpacing: withSpacing)
    }
}
