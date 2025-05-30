//
//  FloatingPoint+HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 5/2/25.
//

extension Double: HangulKitCompatible { }
extension Float: HangulKitCompatible { }

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
extension Float16: HangulKitCompatible { }

// TODO: 테스트 코드 작성
extension HangulKitWrapper where Base: FloatingPoint {
    // MARK: 주석 추가 필요
    public func numberToHangul(withSpace: Bool = false) -> String? {
        guard let result = HangulKit.numberToHangul(base, withSpace: withSpace) else { return nil }
        
        return result
    }
    
    // MARK: 주석 추가 필요
    public func numberToHangulMixed(withSpace: Bool = false) -> String? {
        guard let result = HangulKit.numberToHangulMixed(base, withSpace: withSpace) else { return nil }
        
        return result
    }
}
