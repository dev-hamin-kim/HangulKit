//
//  transform12th.swift
//  HangulKit
//
//  Created by 김하민 on 4/15/25.
//

public extension Hangul {
    
    static fileprivate func handleNextChoseongIsㄱㄷㅈㅅ(current: Syllable, next: Syllable) -> (Syllable, Syllable) {
        let ㄱㄷㅈㅅ: [Character] = ["ㄱ", "ㄷ", "ㅈ", "ㅅ"]
        
        guard ㄱㄷㅈㅅ.contains(next.choseong) else { return (current, next) }
        
        let updatedCurrent = replace받침ㅎ(of: current)
        let updatedNext = Syllable(choseong: 발음변환_받침_ㅎ_발음[next.choseong]!,
                                   jungseong: next.jungseong,
                                   jongseong: next.jongseong)
   
        return (updatedCurrent, updatedNext)
    }

    static fileprivate func handleNextChoseongIsㄴ(current: Syllable, next: Syllable) -> (Syllable, Syllable) {
        let isCurrentJongseongㄶorㅀ = current.jongseong == "ㄶ" || current.jongseong == "ㅀ"
        
        guard next.choseong == "ㄴ" && isCurrentJongseongㄶorㅀ else { return (current, next) }
        
        let updatedCurrent = replace받침ㅎ(of: current)
        
        return (updatedCurrent, next)
    }

    static fileprivate func handleNextChoseongIsㅇ(current: Syllable, next: Syllable) -> (Syllable, Syllable) {
        let isCurrentJongseongㄶorㅀ = current.jongseong == "ㄶ" || current.jongseong == "ㅀ"
        
        var updatedCurrent = replace받침ㅎ(of: current)
        
        guard next.choseong == 음가가_없는_자음 else { return (updatedCurrent, next) }
        
        if !isCurrentJongseongㄶorㅀ { updatedCurrent = Syllable(choseong: current.choseong,
                                                               jungseong: current.jungseong) }
        
        return (updatedCurrent, next)
    }
    
    static fileprivate func handleCurrentJongseongIsㅇ(current: Syllable) -> Syllable {
        let updatedCurrent = replace받침ㅎ(of: current)
        
        return updatedCurrent
    }

    static fileprivate func handleNextChoseongIsㅎ(current: Syllable, next: Syllable?) -> (Syllable, Syllable?) {
        guard 발음변환_첫소리_ㅎ.contains(current.jongseong ?? " ") && next?.choseong == "ㅎ" else { return (current, next) }
        
        let updatedNext = Syllable(choseong: 발음변환_첫소리_ㅎ_발음[current.jongseong ?? " "] ?? " ",
                                   jungseong: next!.jungseong,
                                   jongseong: next?.jongseong)
        
        let updatedCurrent = Syllable(choseong: current.choseong,
                                      jungseong: current.jungseong)
        
        return (updatedCurrent, updatedNext)
    }
    
}
