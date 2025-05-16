//
//  romanize.swift
//  HangulKit
//
//  Created by 김하민 on 4/15/25.
//

public extension HangulKit {
    
    static private let 중성_알파벳_발음: [Character: String] = [
        // MARK: - 단모음
        "ㅏ": "a",
        "ㅓ": "eo",
        "ㅗ": "o",
        "ㅜ": "u",
        "ㅡ": "eu",
        "ㅣ": "i",
        "ㅐ": "ae",
        "ㅔ": "e",
        "ㅚ": "oe",
        "ㅟ": "wi",
        // MARK: - 이중모음
        "ㅑ": "ya",
        "ㅕ": "yeo",
        "ㅛ": "yo",
        "ㅠ": "yu",
        "ㅒ": "yae",
        "ㅖ": "ye",
        "ㅘ": "wa",
        "ㅙ": "wae",
        "ㅝ": "wo",
        "ㅞ": "we",
        "ㅢ": "ui",
    ]
    
    static private let 초성_알파벳_발음: [Character: String] = [
        // MARK: - 파열음
        "ㄱ": "g",
        "ㄲ": "kk",
        "ㅋ": "k",
        "ㄷ": "d",
        "ㄸ": "tt",
        "ㅌ": "t",
        "ㅂ": "b",
        "ㅃ": "pp",
        "ㅍ": "p",
        // MARK: - 파찰음
        "ㅈ": "j",
        "ㅉ": "jj",
        "ㅊ": "ch",
        // MARK: - 마찰음
        "ㅅ": "s",
        "ㅆ": "ss",
        "ㅎ": "h",
        // MARK: - 비음
        "ㄴ": "n",
        "ㅁ": "m",
        "ㅇ": "",
        // MARK: - 유음
        "ㄹ": "r",
    ]
    
    static private let 종성_알파벳_발음: [Character?: String] = [
        "ㄱ": "k",
        "ㄴ": "n",
        "ㄷ": "t",
        "ㄹ": "l",
        "ㅁ": "m",
        "ㅂ": "p",
        "ㅇ": "ng",
        nil: "",
    ]

    static func romanize(hangul: String) -> String {
        let changedHangul = standardizePronunciation(hangul, hardConversion: false)
        let arrayHangul = Array(changedHangul)
        
        return arrayHangul
            .enumerated()
            .map { (i, _) in
                romanizeSyllableHangul(arrayHangul, index: i)
            }
            .joined()
    }
    
    static private func romanizeSyllableHangul(_ arrayHangul: [Character], index: Int) -> String {
        let syllable = arrayHangul[index]
        
        if isHangulCharacter(syllable) {
            let disassemble = disassembleCompleteCharacter(syllable)!
            
            var choseong = 초성_알파벳_발음[disassemble.choseong] ?? "l"
            let jungseong = 중성_알파벳_발음[disassemble.jungseong] ?? ""
            let jongseong = 종성_알파벳_발음[disassemble.jongseong] ?? ""
            
            // 'ㄹ'은 모음 앞에서는 'r'로, 자음 앞이나 어말에서는 'l'로 적는다. 단, 'ㄹㄹ'은 'll'로 적는다. (ex.울릉, 대관령),
            if disassemble.choseong == "ㄹ" && index > 0 && isHangulCharacter(arrayHangul[index - 1]) {
                let prevDisassemble = disassembleCompleteCharacter(arrayHangul[index - 1])
                
                if prevDisassemble?.jongseong == "ㄹ" {
                    choseong = "l"
                }
            }
            
            return choseong + jungseong + jongseong
        }
        
        if let jungseongOnly = 중성_알파벳_발음[syllable] { return jungseongOnly }
        
        if let choseongOnly = 초성_알파벳_발음[syllable] { return choseongOnly }
        
        return String(syllable)
    }
    
}
