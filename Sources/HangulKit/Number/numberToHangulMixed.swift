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
    static func numberToHangulMixed<T: SignedInteger>(_ number: T, withSpacing: Bool = false) -> String {
        
        if number == 0 { return "0" }
        
        let isNegative = number.signum() == -1
        let absouluteValue = String(describing: number.magnitude)
        
        var result = integerPartToHangul(absouluteValue, withSpacing: withSpacing)
        
        if isNegative {
            result = "-" + result
        }
        
        return result
    }
    
    static func numberToHangulMixed<T: UnsignedInteger>(_ number: T, withSpacing: Bool = false) -> String {

        if number == 0 { return "0" }

        let numberAsString = String(describing: number)
        
        let result = integerPartToHangul(numberAsString, withSpacing: withSpacing)
        
        return result
    }
    
    static func numberToHangulMixed<T: FloatingPoint>(_ number: T, withSpacing: Bool = false) -> String? {

        if number.isNaN { return nil }
        if number == 0 { return "0" }
        
        let isNegative = number.sign == .minus
        
        if number.isInfinite && !isNegative { return "무한대" }
        if number.isInfinite && isNegative { return withSpacing ? "마이너스 무한대" : "마이너스무한대" }
        
        let absouluteValue = number.magnitude
        let absouluteValueString = String(describing: absouluteValue)
        
        let separated = absouluteValueString.split(separator: ".")
        let integerPart = separated[0]
        let decimalPart = separated[1]

        var result = integerPart == "0" ? "영" : integerPartToHangul(String(decimalPart), withSpacing: withSpacing)
        
        if !decimalPart.isEmpty {
            let decimalKorean = decimalPart
                .map { HangulKit.Numbers[$0.wholeNumberValue!] }
                .joined()
            
            if withSpacing { result += "점 " + decimalKorean }
            else { result += "점" + decimalKorean }
        }
        
        if isNegative {
            result = "-" + result
        }
        
        return result
    }
    
    static private func integerPartToHangul(_ num: String, withSpacing: Bool) -> String {
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
            .joined(separator: withSpacing ? " " : "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        return result
    }
    
}
