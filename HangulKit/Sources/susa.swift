//
//  susa.swift
//  HangulKit
//
//  Created by 김하민 on 4/24/25.
//

public extension Hangul {
    
    static fileprivate let susaMap = [
        1: "하나",
        2: "둘",
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

    static fileprivate let susaClassifierMap = [
        1: "한",
        2: "두",
        3: "세",
        4: "네",
        20: "스무",
    ]
        
    static func susa(of num: Int, classifier: Bool = false) -> String {
        guard 1...100 ~= num else { return "지원하지 않는 숫자입니다." }
        
        return classifier ? getClassifierWord(of: num) : getNumberWord(of: num)
    }
    
    static fileprivate func getClassifierWord(of num: Int) -> String {
        if num == 20 { return "스무" }
        
        let tens = num / 10 * 10
        let ones = num % 10
        
        let tensWord = susaMap[tens] ?? ""
        
        if ones == 0 { return tensWord }
        
        let onesWord = susaClassifierMap[ones] ?? susaMap[ones] ?? ""
        
        return tensWord + onesWord
    }

    static fileprivate func getNumberWord(of num: Int) -> String {
        if num == 100 { return "백" }
        
        let tens = num / 10 * 10
        let ones = num % 10
        
        let tensWord = susaMap[tens] ?? ""
        let onesWord = susaMap[ones] ?? ""
        
        return tensWord + onesWord
    }
}
