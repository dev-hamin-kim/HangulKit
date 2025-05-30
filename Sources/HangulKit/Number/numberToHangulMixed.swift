//
//  numberToHangulMixed.swift
//  HangulKit
//
//  Created by 김하민 on 4/14/25.
//

import Foundation

public extension HangulKit {
    
    // Swift 특성상 JS/TS를 사용하는 es-hangul과는 다르게 정수/실수 중 하나만을 사용가능.
    // 따라서 로직이 조금 차이가 있으니 유의.
    static func numberToHangulMixed<T: SignedInteger>(_ number: T, withSpace: Bool = false) -> String {
        
        if number == 0 { return "0" }
        
        let isNegative = number.signum() == -1
        let absouluteValue = String(describing: number.magnitude)
        
        var result = integerPartToHangul(absouluteValue, withSpace: withSpace)
        
        if isNegative {
            result = "-" + result
        }
        
        return result
    }
    
    static func numberToHangulMixed<T: UnsignedInteger>(_ number: T, withSpace: Bool = false) -> String {

        if number == 0 { return "0" }

        let numberAsString = String(describing: number)
        
        let result = integerPartToHangul(numberAsString, withSpace: withSpace)
        
        return result
    }
    
    static func numberToHangulMixed<T: FloatingPoint>(_ number: T, withSpace: Bool = false) -> String? {

        if number.isNaN { return nil }
        if number == 0 { return "0" }
        
        let isNegative = number.sign == .minus
        
        if number.isInfinite && !isNegative { return "무한대" }
        if number.isInfinite && isNegative { return "-무한대" }
        
        let absouluteValue = number.magnitude
        let absouluteValueString = String(describing: absouluteValue)
        
        let separated = absouluteValueString.split(separator: ".")
        let integerPart = separated[0]
        let decimalPart = separated[1]

        var result = integerPart == "0" ? "0" : integerPartToHangul(String(integerPart), withSpace: withSpace)
        
        if !decimalPart.isEmpty {
            result += "." + decimalPart
        }
        
        if isNegative {
            result = "-" + result
        }
        
        return result
    }
    
    static private func integerPartToHangul(_ num: String, withSpace: Bool) -> String {
        var koreanParts: [String] = []
        
        var remainingDigits = num
        var placeIndex = 0
        
        while remainingDigits.count > 0 {
            let currentPart = remainingDigits.suffix(4)
            
            if currentPart != "" {
                let formatter: NumberFormatter = {
                   let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal
                    return formatter
                }()
                
                let formattedNumber = formatter.string(from: Int(currentPart)! as NSNumber) ?? ""
                
                koreanParts.insert(formattedNumber == "0" ? "" : formattedNumber + HangulKit.Digits[placeIndex], at: 0)
            }
            
            remainingDigits = String(remainingDigits.dropLast(4))
            placeIndex += 1
        }
        
        let result: String = koreanParts
            .filter { $0 != "" }
            .joined(separator: withSpace ? " " : "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        return result
    }
    
}
