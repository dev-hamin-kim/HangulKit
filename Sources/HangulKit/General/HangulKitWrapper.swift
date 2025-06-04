//
//  HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 3/12/25.
//

import Foundation

// 원래 아래 구조체의 이름을 HangulKit으로 하려 했으나,
// 모듈과 똑같은 이름의 public generic struct를 사용하면 특정 상황에서 빌드가 안 되는 문제가 있음.
// 그래서 이름을 HangulKitWrapper로 하였으며 (KingFisher가 채택한 방식),
// 자세한 내용은 https://github.com/apple/swift/issues/56573 참고.
public struct HangulKitWrapper<Base> {
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

/// HangulKit과 호환이 가능한 타입을 나타냅니다.
/// 이 프로토콜을 적용한 타입에서 hk 프로퍼티를 통하여 값을 HangulKit의 메서드로 전달하여 사용할 수 있습니다.
///
/// HangulKit의 메서드가 입력값으로 받을 수 있는 자료형들이 본 프로토콜을 준수합니다.
///
/// 예시로 아래 코드를 보면, String 자료형에서 hk 프로퍼티를 접근하여 String을 입력값으로 받는 addJosa 메서드를 호출하는 것을 불 수 있습니다:
///
/// ```swift
/// let 샴푸에조사추가 = "샴푸".hk.addJosa(within: .이_가)
/// print(샴푸에조사추가) // prints Optional("샴푸가")
/// ```
///
/// 다른 예시를 보면, Int 자료형에서 hk 프로퍼티를 접근하여 Int를 입력값으로 받는 numberToHangulMixed 메서드를 호출하는 것을 볼 수 있습니다:
///
/// ```swift
/// let number = 123_456_780.hk.numberToHangulMixed()
/// print(number) // prints "1억2,345만6,780"
/// ```
///
/// 이 외에도 HangulKit의 기본적인 사용방법에 대해 더 알아보려면, <doc:시작하기> 문서를 참고해주세요.
public protocol HangulKitCompatible {
    associatedtype HangulKitBase
    
    static var hk: HangulKitWrapper<HangulKitBase>.Type { get set }
    
    var hk: HangulKitWrapper<HangulKitBase> { get set }
}

extension HangulKitCompatible {
    public static var hk: HangulKitWrapper<Self>.Type {
        get { HangulKitWrapper<Self>.self }
        set { }
    }
    
    public var hk: HangulKitWrapper<Self> {
        get { HangulKitWrapper(self) }
        set { }
    }
}

extension NSObject: HangulKitCompatible { }
