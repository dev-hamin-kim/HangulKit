//
//  transform17th.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

public extension Hangul {
    
    static func transform17th(currentSyllable: Syllable, nextSyllable: Syllable) -> (Syllable, Syllable) {
        let 제17항주요조건_충족 = nextSyllable.jungseong == "ㅣ"
        
        guard 제17항주요조건_충족 else { return (currentSyllable, nextSyllable) }
        
        var (current, next) = (currentSyllable, nextSyllable)
        
        (current, next) = handleChoseongIsㅇ(current: current, next: next)
        (current, next) = handleChoseongIsㅎAndㄷ(current: current, next: next)
        
        return (current, next)
    }
    
    static fileprivate func handleChoseongIsㅇ(current: Syllable, next: Syllable) -> (Syllable, Syllable) {
        guard let currentJongseong = current.jongseong else { return (current, next) }
        guard next.choseong == "ㅇ" && 음의_동화_받침[currentJongseong] != nil else { return (current, next) }
        
        let updatedCurrent = Syllable(choseong: current.choseong,
                                      jungseong: current.jungseong,
                                      jongseong: currentJongseong == "ㄾ" ? "ㄹ" : nil)
        
        let updatedNext = Syllable(choseong: 음의_동화_받침[currentJongseong]!,
                                   jungseong: next.jungseong,
                                   jongseong: next.jongseong)
        
        return (updatedCurrent, updatedNext)
    }
    
    static fileprivate func handleChoseongIsㅎAndㄷ(current: Syllable, next: Syllable) -> (Syllable, Syllable) {
        guard current.jongseong == "ㄷ" && next.choseong == "ㅎ" else { return (current, next) }
        
        let updatedCurrent = Syllable(choseong: current.choseong,
                                      jungseong: current.jungseong,
                                      jongseong: nil)
        
        let updatedNext = Syllable(choseong: "ㅊ",
                                   jungseong: next.jungseong,
                                   jongseong: next.jongseong)
        
        return (updatedCurrent, updatedNext)
    }
    
}
