//
//  transform20th.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

public extension Hangul {

    static fileprivate func applyMainCondition(current: Syllable, next: Syllable) -> Syllable {
        guard current.jongseong == "ㄴ" && next.choseong == "ㄹ" else { return current }
        
        let updatedCurrent = Syllable(choseong: current.choseong,
                                      jungseong: current.jungseong,
                                      jongseong: "ㄹ")
        
        return updatedCurrent
    }

    static fileprivate func applySupplementaryCondition(current: Syllable, next: Syllable) -> Syllable {
        guard next.choseong == "ㄴ" && ["ㄹ", "ㄾ", "ㅀ"].contains(current.jongseong) else { return next }
        
        let updatedNext = Syllable(choseong: "ㄹ",
                                   jungseong: next.jungseong,
                                   jongseong: next.jongseong)
        
        return updatedNext
    }

}
