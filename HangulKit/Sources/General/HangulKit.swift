//
//  HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 3/12/25.
//

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

public protocol HangulKitCompatible {
    associatedtype HangulKitBase
    
    static var hangul: HangulKitWrapper<HangulKitBase>.Type { get set }
    
    var hangul: HangulKitWrapper<HangulKitBase> { get set }
}

extension HangulKitCompatible {
    public static var hangul: HangulKitWrapper<Self>.Type {
        get { HangulKitWrapper<Self>.self }
        set { }
    }
    
    public var hangul: HangulKitWrapper<Self> {
        get { HangulKitWrapper(self) }
        set { }
    }
}

extension NSObject: HangulKitCompatible { }
