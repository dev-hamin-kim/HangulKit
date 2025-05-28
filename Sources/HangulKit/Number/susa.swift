//
//  susa.swift
//  HangulKit
//
//  Created by 김하민 on 4/24/25.
//

public extension HangulKit {
    
    static private let susaMap = [
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

    static private let susaClassifierMap = [
        1: "한",
        2: "두",
        3: "세",
        4: "네",
        20: "스무",
    ]
    
    /// 숫자를 순 우리말 수사로 변환합니다.
    /// 주어진 숫자가 0보다 크고 100이하일 때 유효하며, 범위를 벗어났을 경우, nil을 반환합니다.
    ///
    ///     HangulKit.susa(of: 1) // returns Optional("하나")
    ///     HangulKit.susa(of: 2) // returns Optional("둘")
    ///     HangulKit.susa(of: 11) // returns Optional("열하나")
    ///     HangulKit.susa(of: 21) // returns Optional("스물하나")
    ///     HangulKit.susa(of: 99) // returns Optional("아흔아홉")
    ///     HangulKit.susa(of: 100) // returns Optional("백")
    ///     HangulKit.susa(of: 1, classifier: true) // returns Optional("한")
    ///     HangulKit.susa(of: 2, classifier: true) // returns Optional("두")
    ///     HangulKit.susa(of: 11, classifier: true) // returns Optional("열한")
    ///     HangulKit.susa(of: 20, classifier: true) // returns Optional("스무")
    ///     HangulKit.susa(of: 21, classifier: true) // returns Optional("스물한")
    ///
    ///     HangulKit.susa(of: 0) // returns nil
    ///     HangulKit.susa(of: 101) // also returns nil
    ///
    /// - Parameters:
    ///     - num: 순 우리말 수사로 변환할 숫자입니다.
    ///     - classifier: 수관형사를 사용할지 여부를 입력합니다. 기본값은 false입니다.
    ///
    /// - Note:
    /// - `수사`란 숫자를 나타내는 우리말 단어입니다. [자세히 알아보기](https://ko.dict.naver.com/#/entry/koko/d0ce2b674cae4b44b9028f648dd458b0)
    /// - `수관형사`는 사물의 수나 양을 나타내는 관형사입니다. "두 사람"의 "두", "세 근"의 "세" 따위를 뜻합니다. [자세히 알아보기](https://ko.dict.naver.com/#/entry/koko/c513782b82554ff499c80ec616c5b611)
    static func susa(of num: Int, classifier: Bool = false) -> String? {
        guard 1...100 ~= num else { return nil }
        
        return classifier ? getClassifierWord(of: num) : getNumberWord(of: num)
    }
    
    static private func getClassifierWord(of num: Int) -> String {
        if num == 20 { return "스무" }
        
        let tens = num / 10 * 10
        let ones = num % 10
        
        let tensWord = susaMap[tens] ?? ""
        
        if ones == 0 { return tensWord }
        
        let onesWord = susaClassifierMap[ones] ?? susaMap[ones] ?? ""
        
        return tensWord + onesWord
    }

    static private func getNumberWord(of num: Int) -> String {
        if num == 100 { return "백" }
        
        let tens = num / 10 * 10
        let ones = num % 10
        
        let tensWord = susaMap[tens] ?? ""
        let onesWord = susaMap[ones] ?? ""
        
        return tensWord + onesWord
    }
}
