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


