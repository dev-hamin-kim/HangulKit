//
//  transform16th.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

public extension Hangul {
    
    static fileprivate func handleHangulCharacters(
        current: Syllable,
        next: Syllable,
        combinedSyllables: String
    ) -> (Syllable, Syllable) {
         
        guard 한글_자모.contains(combinedSyllables) else { return (current, next) }
        
        let updatedCurrent = Syllable(choseong: current.choseong,
                                      jungseong: current.jungseong,
                                      jongseong: current.jongseong != "ㅇ" ? nil : current.jongseong)
        
        let updatedNext = Syllable(choseong: current.jongseong!,
                                   jungseong: next.jungseong,
                                   jongseong: next.jongseong)
        
        return (updatedCurrent, updatedNext)
    }
    
    static fileprivate func handleSpecialHangulCharacters(
        current: Syllable,
        next: Syllable,
        combinedSyllables: String
    ) -> (Syllable, Syllable) {
        
        guard 특별한_한글_자모.contains(combinedSyllables) else { return (current, next) }
        
        let 다음_음절의_초성 = 특별한_한글_자모의_발음[current.jongseong!]!
        
        let updatedCurrent = Syllable(choseong: current.choseong,
                                      jungseong: current.jungseong)
        
        let updatedNext = Syllable(choseong: 다음_음절의_초성,
                                   jungseong: next.jungseong,
                                   jongseong: next.jongseong)
        
        return (updatedCurrent, updatedNext)
    }
    
}
