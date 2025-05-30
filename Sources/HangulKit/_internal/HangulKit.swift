//
//  Hangul.swift
//  HangulKit
//
//  Created by 김하민 on 3/11/25.
//

public struct HangulKit {
    static func isHangulCharacter(_ input: Character) -> Bool {
        // 타입 선언 생략 시 컴파일러가 ClosedRange<String>으로 추론함.
        let rangeOfHangul: ClosedRange<Character> = "가"..."힣"
        
        return rangeOfHangul.contains(input)
    }
    
    static func isHangulAlphabet(_ input: Character) -> Bool {
        let rangeOfHangulAlphabet: ClosedRange<Character> = "ㄱ"..."ㅣ"
        
        return rangeOfHangulAlphabet.contains(input)
    }
    
    static func isHangul(_ string: String) -> Bool {
        return string.range(of: "\\p{Hangul}", options: .regularExpression) != nil
    }
    
    // es-hangul은 assertHangul이라는 함수가 있으나,
    // Swift의 특성 상, 필요하지 않을 것으로 생각되어 구현하지 않았음.
    // isHangul만 사용해도 충분하다고 결론. parseHangul과 safeParseHangul도 동일.
    
    /// 연음 법칙을 적용하여 두 개의 한글 문자를 연결합니다.
    static func linkHangulCharacters(_ lhs: Character, _ rhs: Character) -> String? {
        var sourceJamo: [Character] = disassembleToGroups(lhs.description)[0]
        let lastJamo = sourceJamo.removeLast()
        
        var result = removeLastCharacter(in: lhs.description)
        
        guard let combinedCharacter = combineCharacter(choseong: lastJamo, jungseong: rhs) else {
            return nil
        }
        
        result.append(combinedCharacter)

        return result
    }

    static func binaryAssembleAlphabets(_ source: Character, _ nextCharacter: Character) -> String? {
        let combinedInputs = "\(source)\(nextCharacter)"
        let correspondingVowel = HangulKit.assembledVowels[combinedInputs]
        
        if let correspondingVowel { return correspondingVowel.description }
        
        if !canBeJungseong(source) && canBeJungseong(nextCharacter) {
            guard let combinedCharacter = combineCharacter(choseong: source, jungseong: nextCharacter) else { return nil }
            
            return String(combinedCharacter)
        }
        
        return combinedInputs
    }
    
    static func binaryAssembleCharacters(_ source: Character, _ nextCharacter: Character) -> String? {
        guard !source.isWhitespace else { return " \(nextCharacter)" }
        guard isHangulCharacter(source) || isHangulAlphabet(source) else { return nil }
        guard isHangulAlphabet(nextCharacter) else { return "\(source)\(nextCharacter)" }
        
        var sourceJamos: [Character] = disassembleToGroups(source.description)[0]
        
        let isSingleCharacter = sourceJamos.count == 1
        
        if isSingleCharacter {
            let sourceCharacter = sourceJamos[0]
            guard let binaryAssembledAlphabets = binaryAssembleAlphabets(sourceCharacter, nextCharacter) else { return nil }
            
            return binaryAssembledAlphabets
        }

        let lastJamo = sourceJamos.removeLast()
        let secondLastJamo = sourceJamos.removeLast()
        let restOfJamos = sourceJamos
        
        let needsLinking = canBeChoseong(lastJamo) && canBeJungseong(nextCharacter)
        
        if needsLinking { return linkHangulCharacters(source, nextCharacter) }
        
        let fixConsonant = curriedCombineCharacter
        let combineJungseong = fixConsonant(restOfJamos.first ?? secondLastJamo)
        
        // source의 마지막 한글과 nextCharacter가 합쳐서 중성이 될 수 있을 때.
        let lastJamoAndNextCharacterCombined = HangulKit.assembledVowels["\(lastJamo)\(nextCharacter)"] ?? " "
        
        if canBeJungseong(lastJamoAndNextCharacterCombined) {
            let jungseongCombined = combineJungseong(lastJamoAndNextCharacterCombined)(nil)!
            
            return String(describing: jungseongCombined)
        }
        
        // source의 마지막 두 글자가 합쳐서 중성, 그리고 nextCharacter가 종성이 될 수 있을 때.
        let lastTwoCombined = HangulKit.assembledVowels["\(secondLastJamo)\(lastJamo)"] ?? " "

        if canBeJungseong(lastTwoCombined) && canBeJongseong(nextCharacter) {
            let jungseongCombined = combineJungseong(lastTwoCombined)(nextCharacter)!
            
            return String(describing: jungseongCombined)
        }
        
        // source의 마지막 한 글자가 중성, nextCharacter가 종성이 될 수 있을 때.
        if canBeJungseong(lastJamo) && canBeJongseong(nextCharacter) {
            let jungseongCombined = combineJungseong(lastJamo)(nextCharacter)!
            
            return String(describing: jungseongCombined)
        }
        
        let fixVowel = combineJungseong
        
        // 여기부터는 es-hangul과 다른 구조를 택함.
        // JS/TS와 Swift의 차이점 때문에 새로 짜는 것이 낫겠다 판단함.
        
        // source의 마지막 한 글자와 nextCharacter가 합쳐저 종성이 될 수 있을 때
        let restOfJamosCombined = HangulKit.assembledConsonants["\(lastJamo)\(nextCharacter)"] ?? " "
        
        if canBeJongseong(restOfJamosCombined) && restOfJamos.count == 1 {
            let fixedVowel = fixVowel(secondLastJamo)(restOfJamosCombined)!
            
            return String(describing: fixedVowel)
        }
        
        if canBeJongseong(restOfJamosCombined) && restOfJamos.count == 2 {
            let combinedVowels = HangulKit.assembledVowels["\(restOfJamos[1])\(secondLastJamo)"] ?? " "
            
            let fixedVowel = fixVowel(combinedVowels)(restOfJamosCombined)!
            
            return String(describing: fixedVowel)
        }
        
        // 위까지의 로직을 차라리 초성 유무, 중성 유무 + 겹낱자 여부, 종성 유무 + 겹낱자 여부 이렇게? 바꾸는 건 어떨지 생각...?
        
//        if restOfJamos.count >= 3 {
//            let restOfJamosCombined = HangulKit.assembledVowels["\(restOfJamos[1])\(restOfJamos[2])"] ?? " "
//            let combineJongseong = fixVowel(
//                canBeJungseong(restOfJamosCombined) ? restOfJamosCombined : restOfJamos[1]
//            )
//            
//            let lastConsonant = lastJamo
//            let lastConsonantNextCharacterCombined = HangulKit.assembledConsonants["\(lastConsonant)\(nextCharacter)"] ?? " "
//            
//            if hasBatchim(source, .single) &&
//                canBeJongseong(lastConsonantNextCharacterCombined) {
//                return combineJongseong(lastConsonantNextCharacterCombined).description
//            }
//        }
        
        return "\(source)\(nextCharacter)"
    }
    
    static func binaryAssemble(_ source: String, _ nextCharacter: Character) -> String {
        guard source != " " else { return " " + "\(nextCharacter)" }
        
        guard let lastCharacter = source.last else { return "\(nextCharacter)" }
        
        let binaryAssembledCharacters = binaryAssembleCharacters(lastCharacter, nextCharacter) ?? ""
        
        let result = [
            String(source.dropLast(1)),
            binaryAssembledCharacters,
        ].joined()
        
        return result
    }
    
    // MARK: 이거 좀 덜 복잡하게 할 수 있는 방법이 없을까...?
    static let curriedCombineCharacter:
    (_ choseong: Character) ->
    (_ jungseong: Character) ->
    (_ jongseong: Character?) -> Character?
    = { choseong in
        return { jungseong in
            return { jongseong in
                return combineCharacter(choseong: choseong, jungseong: jungseong, jongseong: jongseong)
            }
        }
    }
}
