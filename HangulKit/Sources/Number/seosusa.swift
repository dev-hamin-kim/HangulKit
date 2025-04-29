//
//  seosusa.swift
//  HangulKit
//
//  Created by 김하민 on 4/24/25.
//

public extension Hangul {
    
    static fileprivate let SeosusaMap = [
        1: "한",
        2: "두",
        3: "셋",
        4: "넷",
        5: "다섯",
        6: "여섯",
        7: "일곱",
        8: "여덟",
        9: "아홉",
        10: "열",
        20: "스물",
        30: "서른",
        40: "마흔",
        50: "쉰",
        60: "예순",
        70: "일흔",
        80: "여든",
        90: "아흔",
        100: "백",
    ]

    static fileprivate let SeosusaSpecialCaseMap = [
        1: "첫",
        2: "둘",
        20: "스무",
    ]

    /// 숫자를 한글 서수사로 변환합니다.
    ///
    ///     Hangul.seosusa(of: 1) // returns "첫째"
    ///     Hangul.seosusa(of: 2) // returns "둘째"
    ///     Hangul.seosusa(of: 3) // returns "셋째"
    ///     Hangul.seosusa(of: 10) // returns "열째"
    ///     Hangul.seosusa(of: 11) // returns "열한째"
    ///     Hangul.seosusa(of: 12) // returns "열두째"
    ///     Hangul.seosusa(of: 13) // returns "열셋째"
    ///     Hangul.seosusa(of: 20) // returns "스무째"
    ///     Hangul.seosusa(of: 21) // returns "스물한째"
    ///     Hangul.seosusa(of: 30) // returns "서른째"
    ///     Hangul.seosusa(of: 40) // returns "마흔째"
    ///     Hangul.seosusa(of: 99) // returns "아흔아홉째"
    ///     Hangul.seosusa(of: 100) // returns "백째"
    ///
    /// - Note:
    /// - `서수사`는 순서를 나타내는 단어입니다.
    /// - 1부터 99까지의 정수는 순우리말 서수사 문자열로 변환합니다.
    /// - 100 이상의 정수는 한자어 서수사 문자열로 변환합니다.
    static func seosusa(of num: Int) -> String {
        guard num > 0 else { return "1이상의 정수만 지원합니다." }
        
        if 1...99 ~= num { return "\(getOrdinalWord(num))째" }
        
        return "\(numberToHangul(num))째"
    }
    
    static fileprivate func getOrdinalWord(_ num: Int) -> String {
        if let seosusaSpecialCaseMappedValue = SeosusaSpecialCaseMap[num] {
            return seosusaSpecialCaseMappedValue
        }
        
        let tens = num / 10 * 10
        let ones = num % 10
        
        let tensWord = SeosusaMap[tens] ?? ""
        let onesWord = SeosusaMap[ones] ?? ""
        
        return tensWord + onesWord
    }
}


