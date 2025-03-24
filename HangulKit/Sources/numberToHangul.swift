//
//  numberToHangul.swift
//  HangulKit
//
//  Created by 김하민 on 3/19/25.
//

public extension Hangul {
    
    // Swift 특성상 JS/TS를 사용하는 es-hangul과는 다르게 정수/실수 중 하나만을 사용가능.
    // 따라서 로직이 조금 차이가 있으니 유의.
    static func numberToHangul<T: SignedInteger>(_ number: T, withSpacing: Bool = false) -> String {
        
        if number == 0 { return "영" }
        
        let isNegative = number.signum() == -1
        let absouluteValue = number.magnitude
        let decimalPart = absouluteValue
        
        let absouluteValueString = String(describing: absouluteValue)
        
        var koreanParts: [String] = []
        
        var remainingDigits = Substring(absouluteValueString)
        var placeIndex = 0
        
        while remainingDigits.count > 0 {
            let currentPart = remainingDigits.suffix(4)
            
            let koreanNumber = numberToKoreanUpToThousands(currentPart)
            
            if koreanNumber != "" {
                koreanParts.insert(koreanNumber + Hangul.Digits[placeIndex], at: 0)
            }
            
            remainingDigits = remainingDigits.dropLast(4)
            placeIndex += 1
        }
        
        var result: String = koreanParts
            .filter { $0 != "" }
            .joined(separator: withSpacing ? " " : "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isNegative {
            result = withSpacing ? "마이너스 " + result : "마이너스" + result
        }
        
        return result
    }
    
    static func numberToHangul<T: UnsignedInteger>(_ number: T, withSpacing: Bool = false) -> String {
        
        if number == 0 { return "영" }

        let numberAsString = String(describing: number)
        
        var koreanParts: [String] = []
        
        var remainingDigits = Substring(numberAsString)
        var placeIndex = 0
        
        while remainingDigits.count > 0 {
            let currentPart = remainingDigits.suffix(4)
            
            let koreanNumber = numberToKoreanUpToThousands(currentPart)
            
            if koreanNumber != "" {
                koreanParts.insert(koreanNumber + Hangul.Digits[placeIndex], at: 0)
            }
            
            remainingDigits = remainingDigits.dropLast(4)
            placeIndex += 1
        }
        
        var result: String = koreanParts
            .filter { $0 != "" }
            .joined(separator: withSpacing ? " " : "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        return result
    }
    
    static func numberToHangul<T: FloatingPoint>(_ number: T, withSpacing: Bool = false) throws -> String {
        
        if number.isNaN { throw InputError.notANumber }
        if number == 0 { return "영" }
        
        let isNegative = number.sign == .minus
        
        if number.isInfinite && !isNegative { return "무한대" }
        if number.isInfinite && isNegative { return withSpacing ? "마이너스 무한대" : "마이너스무한대" }
        
        let absouluteValue = number.magnitude
        let absouluteValueString = String(describing: absouluteValue)
        
        let separated = absouluteValueString.split(separator: ".")
        let integerPart = separated[0]
        let decimalPart = separated[1]
        
        var koreanParts: [String] = []
        
        var remainingDigits = integerPart
        var placeIndex = 0
        
        while remainingDigits.count > 0 {
            let currentPart = remainingDigits.suffix(4)
            
            let koreanNumber = numberToKoreanUpToThousands(currentPart)
            
            if koreanNumber != "" {
                koreanParts.insert(koreanNumber + Hangul.Digits[placeIndex], at: 0)
            }
            
            remainingDigits = remainingDigits.dropLast(4)
            placeIndex += 1
        }
        
        var result: String = koreanParts
            .filter { $0 != "" }
            .joined(separator: withSpacing ? " " : "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        if integerPart == "0" {
            result = "영"
        }
        
        if !decimalPart.isEmpty {
            let decimalKorean = decimalPart
                .map { Hangul.Numbers[$0.wholeNumberValue!] }
                .joined()
            
            if withSpacing { result += "점 " + decimalKorean }
            else { result += "점" + decimalKorean }
        }
        
        if isNegative {
            result = withSpacing ? "마이너스 " + result : "마이너스" + result
        }
        
        return result
    }
    
    /// numberToHangul 메서드에서 내부적으로 사용되는 함수.
    static func numberToKoreanUpToThousands<T: StringProtocol>(_ number: T) -> String {
        var koreanDigits = number
            .reversed()
            .enumerated()
            .map { index, char in
                char == "0" ? "" : Hangul.Numbers[char.wholeNumberValue!] + Hangul.Cardinal[index]
            }
            .reversed()
            .joined()
        
        // MARK: 추후 더 효율적인 로직이 있나 찾아보기.
        let wordsToReplace = ["일천", "일백", "일십"]
        let correspondingWords = ["천", "백", "십"]
        
        zip(wordsToReplace, correspondingWords).forEach { wordToReplace, correspondingWord in
            koreanDigits = koreanDigits.replacingOccurrences(of: wordToReplace, with: correspondingWord)
        }
        
        return koreanDigits
    }
}
