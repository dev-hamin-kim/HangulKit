//
//  transform16th.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

extension HangulKit {
    
    static func transform16th(
        currentSyllable: Syllable,
        nextSyllable: Syllable,
        phrase: String,
        index: Int
    ) -> (Syllable, Syllable) {
        let 제16항주요조건_충족 = currentSyllable.jongseong != nil && nextSyllable.choseong == 음가가_없는_자음
        
        guard 제16항주요조건_충족 else { return (currentSyllable, nextSyllable) }
        
        // MARK: 가독성이 별로이니 나중에 고칠 방법을 찾을 것.
        let isIndexZero = index == 0
        
        let first = isIndexZero ? phrase.startIndex : phrase.index(phrase.startIndex, offsetBy: index - 1)
        let second = phrase.index(phrase.startIndex, offsetBy: index)
        let combinedSyllables = isIndexZero ? "" : String(phrase[first]) + String(phrase[second])
        
        var (current, next) = (currentSyllable, nextSyllable)
        
        (current, next) = handleSpecialHangulCharacters(current: current, next: next,
                                                        combinedSyllables: combinedSyllables)
        (current, next) = handleHangulCharacters(current: current, next: next,
                                                 combinedSyllables: combinedSyllables)
        
        return (current, next)
    }
    
    static private func handleHangulCharacters(
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
    
    static private func handleSpecialHangulCharacters(
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
