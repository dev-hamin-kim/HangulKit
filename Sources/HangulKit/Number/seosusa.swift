//
//  seosusa.swift
//  HangulKit
//
//  Created by 김하민 on 4/24/25.
//

public extension HangulKit {
    
    static private let seosusaMap = [
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

    static private let seosusaSpecialCaseMap = [
        1: "첫",
        2: "둘",
        20: "스무",
    ]

    /// 정수를 한글 서수사로 변환합니다.
    /// 0 이하의 정수는 nil을 반환합니다.
    ///
    ///     HangulKit.seosusa(of: 1) // returns Optional("첫째")
    ///     HangulKit.seosusa(of: 2) // returns Optional("둘째")
    ///     HangulKit.seosusa(of: 3) // returns Optional("셋째")
    ///     HangulKit.seosusa(of: 10) // returns Optional("열째")
    ///     HangulKit.seosusa(of: 11) // returns Optional("열한째")
    ///     HangulKit.seosusa(of: 12) // returns Optional("열두째")
    ///     HangulKit.seosusa(of: 13) // returns Optional("열셋째")
    ///     HangulKit.seosusa(of: 20) // returns Optional("스무째")
    ///     HangulKit.seosusa(of: 21) // returns Optional("스물한째")
    ///     HangulKit.seosusa(of: 30) // returns Optional("서른째")
    ///     HangulKit.seosusa(of: 40) // returns Optional("마흔째")
    ///     HangulKit.seosusa(of: 99) // returns Optional("아흔아홉째")
    ///     HangulKit.seosusa(of: 100) // returns Optional("백째")
    ///
    ///     HangulKit.seosusa(of: 0) // returns nil
    ///     HangulKit.seosusa(of: -1) // also returns nil
    ///
    /// - Note:
    /// - `서수사`는 순서를 나타내는 단어입니다.
    /// - 1부터 99까지의 정수는 순우리말 서수사 문자열로 변환합니다.
    /// - 100 이상의 정수는 한자어 서수사 문자열로 변환합니다.
    static func seosusa(of num: Int) -> String? {
        guard num > 0 else { return nil }
        
        if 1...99 ~= num { return "\(getOrdinalWord(num))째" }
        
        return "\(numberToHangul(num))째"
    }
    
    static private func getOrdinalWord(_ num: Int) -> String {
        if let seosusaSpecialCaseMappedValue = seosusaSpecialCaseMap[num] {
            return seosusaSpecialCaseMappedValue
        }
        
        let tens = num / 10 * 10
        let ones = num % 10
        
        let tensWord = seosusaMap[tens] ?? ""
        let onesWord = seosusaMap[ones] ?? ""
        
        return tensWord + onesWord
    }
}


