//
//  Hangul.swift
//  HangulKit
//
//  Created by 김하민 on 3/11/25.
//

//import Foundation

public struct Hangul {
    
    struct Choseong {
        static let unicodeValue = 0x1100
        static let count = 19
        static let range = "ㄱ"..."ㅎ"
        
        /// 초성으로 올 수 있는 한글 글자
        static let list: [Character] = [
            "ㄱ",
            "ㄲ",
            "ㄴ",
            "ㄷ",
            "ㄸ",
            "ㄹ",
            "ㅁ",
            "ㅂ",
            "ㅃ",
            "ㅅ",
            "ㅆ",
            "ㅇ",
            "ㅈ",
            "ㅉ",
            "ㅊ",
            "ㅋ",
            "ㅌ",
            "ㅍ",
            "ㅎ",
        ]
    }
    
    struct Jungseong {
        static let unicodeValue = 0x314F
        static let count = 21
        
        /// 중성으로 올 수 있는 한글 글자
        static let list: [Character] = [
            "ㅏ",
            "ㅐ",
            "ㅑ",
            "ㅒ",
            "ㅓ",
            "ㅔ",
            "ㅕ",
            "ㅖ",
            "ㅗ",
            "ㅘ",
            "ㅙ",
            "ㅚ",
            "ㅛ",
            "ㅜ",
            "ㅝ",
            "ㅞ",
            "ㅟ",
            "ㅠ",
            "ㅡ",
            "ㅢ",
            "ㅣ",
        ]
    }
    
    struct Jongseong {
        static let unicodeValue = 0x11A8
        static let count = 28
        
        /// 종성으로 올 수 있는 한글 글자
        static let list: [Character?] = [
            nil,
            "ㄱ",
            "ㄲ",
            "ㄳ",
            "ㄴ",
            "ㄵ",
            "ㄶ",
            "ㄷ",
            "ㄹ",
            "ㄺ",
            "ㄻ",
            "ㄼ",
            "ㄽ",
            "ㄾ",
            "ㄿ",
            "ㅀ",
            "ㅁ",
            "ㅂ",
            "ㅄ",
            "ㅅ",
            "ㅆ",
            "ㅇ",
            "ㅈ",
            "ㅊ",
            "ㅋ",
            "ㅌ",
            "ㅍ",
            "ㅎ",
        ]
    }
    
    enum InputError: Error {
        case notANumber
        case notAHangul
        case notACompletedHangul
    }
    
    static let JasoHangulNFD = "각힣".precomposedStringWithCanonicalMapping.unicodeScalars.map { String($0) }
    
    static let CompleteHangulStartUnicodeScalar = "가".unicodeScalars.first!.value
    static let CompleteHangulEndUnicodeScalar = "힣".unicodeScalars.first!.value
    
    static let NumberOfJongseong: UInt32 = 28
    static let NumberOfJungseong: UInt32 = 21
    
    // 기존 es-hangul에서는 DISASSEMBLED_CONSONANTS_BY_CONSONANT라는 명칭을 사용하나,
    // DISASSEMBLED_CONSONANTS만 적더라도 충분히 의미가 전달된다 판단됨.
    // (한글을 사용하는 사람이라면 자,모음이 결합된다는 규칙을 익히 알고 있기 때문에...)
    static let DisassembledConsonants: [Character?: [Character]] = [
        // (from es-hangul) 종성이 없는 경우 '빈' 초성으로 관리하는 것이 편리하여, 빈 문자열도 포함한다.
        nil: [],
        "ㄱ": ["ㄱ"],
        "ㄲ": ["ㄲ"],
        "ㄳ": ["ㄱ", "ㅅ"],
        "ㄴ": ["ㄴ"],
        "ㄵ": ["ㄴ", "ㅈ"],
        "ㄶ": ["ㄴ", "ㅎ"],
        "ㄷ": ["ㄷ"],
        "ㄸ": ["ㄸ"],
        "ㄹ": ["ㄹ"],
        "ㄺ": ["ㄹ", "ㄱ"],
        "ㄻ": ["ㄹ", "ㅁ"],
        "ㄼ": ["ㄹ", "ㅂ"],
        "ㄽ": ["ㄹ", "ㅅ"],
        "ㄾ": ["ㄹ", "ㅌ"],
        "ㄿ": ["ㄹ", "ㅍ"],
        "ㅀ": ["ㄹ", "ㅎ"],
        "ㅁ": ["ㅁ"],
        "ㅂ": ["ㅂ"],
        "ㅃ": ["ㅃ"],
        "ㅄ": ["ㅂ", "ㅅ"],
        "ㅅ": ["ㅅ"],
        "ㅆ": ["ㅆ"],
        "ㅇ": ["ㅇ"],
        "ㅈ": ["ㅈ"],
        "ㅉ": ["ㅉ"],
        "ㅊ": ["ㅊ"],
        "ㅋ": ["ㅋ"],
        "ㅌ": ["ㅌ"],
        "ㅍ": ["ㅍ"],
        "ㅎ": ["ㅎ"],
    ]
    
    static let DisassembledVowels: [Character: [Character]] = [
        "ㅏ": ["ㅏ"],
        "ㅐ": ["ㅐ"],
        "ㅑ": ["ㅑ"],
        "ㅒ": ["ㅒ"],
        "ㅓ": ["ㅓ"],
        "ㅔ": ["ㅔ"],
        "ㅕ": ["ㅕ"],
        "ㅖ": ["ㅖ"],
        "ㅗ": ["ㅗ"],
        "ㅘ": ["ㅗ", "ㅏ"],
        "ㅙ": ["ㅗ", "ㅐ"],
        "ㅚ": ["ㅗ", "ㅣ"],
        "ㅛ": ["ㅛ"],
        "ㅜ": ["ㅜ"],
        "ㅝ": ["ㅜ", "ㅓ"],
        "ㅞ": ["ㅜ", "ㅔ"],
        "ㅟ": ["ㅜ", "ㅣ"],
        "ㅠ": ["ㅠ"],
        "ㅡ": ["ㅡ"],
        "ㅢ": ["ㅡ", "ㅣ"],
        "ㅣ": ["ㅣ"],
    ]
    
    static let assembledVowels: [String: Character] = [
        "ㅏ": "ㅏ",
        "ㅐ": "ㅐ",
        "ㅑ": "ㅑ",
        "ㅒ": "ㅒ",
        "ㅓ": "ㅓ",
        "ㅔ": "ㅔ",
        "ㅕ": "ㅕ",
        "ㅖ": "ㅖ",
        "ㅗ": "ㅗ",
        "ㅗㅏ": "ㅘ",
        "ㅗㅐ": "ㅙ",
        "ㅗㅣ": "ㅚ",
        "ㅛ": "ㅛ",
        "ㅜ": "ㅜ",
        "ㅜㅓ": "ㅝ",
        "ㅜㅔ": "ㅞ",
        "ㅜㅣ": "ㅟ",
        "ㅠ": "ㅠ",
        "ㅡ": "ㅡ",
        "ㅡㅣ": "ㅢ",
        "ㅣ": "ㅣ",
    ]
    
    static let assembledConsonants: [String: Character] = [
        "ㄱ": "ㄱ",
        "ㄲ": "ㄲ",
        "ㄱㅅ": "ㄳ",
        "ㄴ": "ㄴ",
        "ㄴㅈ": "ㄵ",
        "ㄴㅎ": "ㄶ",
        "ㄷ": "ㄷ",
        "ㄸ": "ㄸ",
        "ㄹ": "ㄹ",
        "ㄹㄱ": "ㄺ",
        "ㄹㅁ": "ㄻ",
        "ㄹㅂ": "ㄼ",
        "ㄹㅅ": "ㄽ",
        "ㄹㅌ": "ㄾ",
        "ㄹㅍ": "ㄿ",
        "ㄹㅎ": "ㅀ",
        "ㅁ": "ㅁ",
        "ㅂ": "ㅂ",
        "ㅃ": "ㅃ",
        "ㅂㅅ": "ㅄ",
        "ㅅ": "ㅅ",
        "ㅆ": "ㅆ",
        "ㅇ": "ㅇ",
        "ㅈ": "ㅈ",
        "ㅉ": "ㅉ",
        "ㅊ": "ㅊ",
        "ㅋ": "ㅋ",
        "ㅌ": "ㅌ",
        "ㅍ": "ㅍ",
        "ㅎ": "ㅎ",
    ]
    
    
    static let Digits = [
        "",
        "만",
        "억",
        "조",
        "경",
        "해",
        "자",
        "양",
        "구",
        "간",
        "정",
        "재",
        "극",
        "항하사",
        "아승기",
        "나유타",
        "불가사의",
        "무량대수",
        "겁",
        "업",
    ]
    
    static let DigitsMax = Digits.count * 4
    
    static let Numbers = ["", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
    static let NumbersForDecimal = ["영", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
    static let Cardinal = ["", "십", "백", "천"]
    
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
    static func linkHangulCharacters(_ lhs: Character, _ rhs: Character) -> String {
        var sourceJamo: [Character] = disassembleToGroups(lhs.description)[0]
        let lastJamo = sourceJamo.removeLast()
        
        var result = removeLastCharacter(lhs.description)
        try! result.append(combineCharacter(choseong: lastJamo, jungseong: rhs))

        return result
    }

    static func binaryAssembleAlphabets(_ source: Character, _ nextCharacter: Character) -> String {
        let combinedInputs = "\(source)\(nextCharacter)"
        let correspondingVowel = Hangul.assembledVowels[combinedInputs]
        
        if let correspondingVowel { return correspondingVowel.description }
        
        if !canBeJungseong(source) && canBeJungseong(nextCharacter) {
            return try! combineCharacter(choseong: source, jungseong: nextCharacter).description
        }
        
        return combinedInputs
    }
    
    static func binaryAssembleCharacters(_ source: Character, _ nextCharacter: Character) -> String {
        
        // MARK: 이 가드문들이 던지는 에러를 적절하게 작성할 것.
        guard source.isWhitespace == false else { return " \(nextCharacter)" }
        guard isHangulCharacter(source) || isHangulAlphabet(source) else { return "" }
        guard isHangulAlphabet(nextCharacter) else { return "\(source)\(nextCharacter)" }
        
        var sourceJamos: [Character] = disassembleToGroups(source.description)[0]
        
        let isSingleCharacter = sourceJamos.count == 1
        
        if isSingleCharacter {
            let sourceCharacter = sourceJamos[0]
            return binaryAssembleAlphabets(sourceCharacter, nextCharacter).description
        }

        let lastJamo = sourceJamos.removeLast()
        let secondLastJamo = sourceJamos.removeLast()
        let restOfJamos = sourceJamos
        
        let needsLinking = canBeChoseong(lastJamo) && canBeJungseong(nextCharacter)
        
        if needsLinking { return linkHangulCharacters(source, nextCharacter) }
        
        let fixConsonant = curriedCombineCharacter
        let combineJungseong = fixConsonant(restOfJamos.first ?? secondLastJamo)
        
        // source의 마지막 한글과 nextCharacter가 합쳐서 중성이 될 수 있을 때.
        let lastJamoAndNextCharacterCombined = Hangul.assembledVowels["\(lastJamo)\(nextCharacter)"] ?? " "
        
        if canBeJungseong(lastJamoAndNextCharacterCombined) {
            return combineJungseong(lastJamoAndNextCharacterCombined)(nil).description
        }
        
        // source의 마지막 두 글자가 합쳐서 중성, 그리고 nextCharacter가 종성이 될 수 있을 때.
        let lastTwoCombined = Hangul.assembledVowels["\(secondLastJamo)\(lastJamo)"] ?? " "

        if canBeJungseong(lastTwoCombined) && canBeJongseong(nextCharacter) {
            return combineJungseong(lastTwoCombined)(nextCharacter).description
        }
        
        // source의 마지막 한 글자가 중성, nextCharacter가 종성이 될 수 있을 때.
        if canBeJungseong(lastJamo) && canBeJongseong(nextCharacter) {
            return combineJungseong(lastJamo)(nextCharacter).description
        }
        
        let fixVowel = combineJungseong
        
        // 여기부터는 es-hangul과 다른 구조를 택함.
        // JS/TS와 Swift의 차이점 때문에 새로 짜는 것이 낫겠다 판단함.
        
        // source의 마지막 한 글자와 nextCharacter가 합쳐저 종성이 될 수 있을 때
        let restOfJamosCombined = Hangul.assembledConsonants["\(lastJamo)\(nextCharacter)"] ?? " "
        
        if canBeJongseong(restOfJamosCombined) && restOfJamos.count == 1 {
            return fixVowel(secondLastJamo)(restOfJamosCombined).description
        }
        
        if canBeJongseong(restOfJamosCombined) && restOfJamos.count == 2 {
            let combinedVowels = Hangul.assembledVowels["\(restOfJamos[1])\(secondLastJamo)"] ?? " "
            
            return fixVowel(combinedVowels)(restOfJamosCombined).description
        }
        
        // 위까지의 로직을 차라리 초성 유무, 중성 유무 + 겹낱자 여부, 종성 유무 + 겹낱자 여부 이렇게? 바꾸는 건 어떨지 생각...?
        
//        if restOfJamos.count >= 3 {
//            let restOfJamosCombined = Hangul.assembledVowels["\(restOfJamos[1])\(restOfJamos[2])"] ?? " "
//            let combineJongseong = fixVowel(
//                canBeJungseong(restOfJamosCombined) ? restOfJamosCombined : restOfJamos[1]
//            )
//            
//            let lastConsonant = lastJamo
//            let lastConsonantNextCharacterCombined = Hangul.assembledConsonants["\(lastConsonant)\(nextCharacter)"] ?? " "
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
        
        let result = [
            String(source.dropLast(1)),
            binaryAssembleCharacters(lastCharacter, nextCharacter),
        ].joined()
        
        return result
    }
    
    // MARK: 이거 좀 덜 복잡하게 할 수 있는 방법이 없을까...?
    static let curriedCombineCharacter:
    (_ choseong: Character) ->
    (_ jungseong: Character) ->
    (_ jongseong: Character?) -> Character
    = { choseong in
        return { jungseong in
            return { jongseong in
                return try! combineCharacter(choseong: choseong, jungseong: jungseong, jongseong: jongseong)
            }
        }
    }
}
