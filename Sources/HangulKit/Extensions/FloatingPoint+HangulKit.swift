//
//  FloatingPoint+HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 5/2/25.
//

extension Double: HangulKitCompatible { }
extension Float: HangulKitCompatible { }

@available(iOS 14.0, *)
extension Float16: HangulKitCompatible { }

// TODO: 테스트 코드 작성
extension HangulKitWrapper where Base: FloatingPoint {
    // MARK: 주석 추가 필요
    public func numberToHangul(withSpacing: Bool = false) -> String? {
        guard let result = HangulKit.numberToHangul(base, withSpacing: withSpacing) else { return nil }
        
        return result
    }
    
    // MARK: 주석 추가 필요
    public func numberToHangulMixed(withSpacing: Bool = false) -> String? {
        guard let result = HangulKit.numberToHangul(base, withSpacing: withSpacing) else { return nil }
        
        return result
    }
}
