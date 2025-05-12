//
//  FloatingPoint+HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 5/2/25.
//

extension Double: HangulKitCompatible { }
extension Float: HangulKitCompatible { }
extension Float16: HangulKitCompatible { }

// TODO: 테스트 코드 작성
extension HangulKitWrapper where Base: FloatingPoint {
    // MARK: 주석 추가 필요
    public func numberToHangul(withSpacing: Bool = false) -> String {
        let result = try? HangulKit.numberToHangul(base, withSpacing: withSpacing)
        
        return result ?? "숫자로 표시할 수 없음"
    }
    
    // MARK: 주석 추가 필요
    public func numberToHangulMixed(withSpacing: Bool = false) -> String {
        let result = try? HangulKit.numberToHangul(base, withSpacing: withSpacing)
        
        return result ?? "숫자로 표시할 수 없음"
    }
}
