//
//  days.swift
//  HangulKit
//
//  Created by 김하민 on 4/10/25.
//

public extension Hangul {
    
    static let daysMap: [Int: String] = [
        1: "하루",
        2: "이틀",
        3: "사흘",
        4: "나흘",
        5: "닷새",
        6: "엿새",
        7: "이레",
        8: "여드레",
        9: "아흐레",
        10: "열",
        20: "스무",
    ]
    
    static let daysOnlyTensMap: [Int: String] = [
        10: "열흘",
        20: "스무날",
        30: "서른날",
    ]
    
    static func days(_ number: Int) -> String {
        return getNumberWords(number)
    }
    
    static fileprivate func getNumberWords(_ number: Int) -> String {
        // 기존 es-hangul에 있던 validateNumber 함수의 기능은 대부분 Swift 컴파일러가 해주기 때문에,
        // (아닌가 Float랑 Double도 해야하나...)
        // 일단 1에서 30까지의 숫자인지 체크만 진행.
        guard 1...30 ~= number else { return "" } // MARK: es-hangul에선 에러 타입을 리턴하는데... 어떻게 할지 생각해볼 것.
        
        let tens = number / 10 * 10
        let ones = number % 10
        
        if ones == 0 && daysOnlyTensMap[tens] != nil { return daysOnlyTensMap[tens]! }
        
        let tensWord = daysMap[tens] ?? ""
        let onesWord = daysMap[ones] ?? ""
        
        return tensWord + onesWord
    }
    
    
}
