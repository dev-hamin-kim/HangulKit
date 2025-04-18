//
//  transform13thAnd14th.swift
//  HangulKit
//
//  Created by 김하민 on 4/16/25.
//

public extension Hangul {
    
    static fileprivate let 홀받침: Set<Character> = [
        "ㄱ", "ㄴ", "ㄷ", "ㄹ",
        "ㅁ", "ㅂ", "ㅅ", "ㅇ",
        "ㅈ", "ㅊ", "ㅋ", "ㅌ",
        "ㅍ", "ㅎ"
    ]
    
    static fileprivate let 겹받침: Set<Character> = [
        "ㄳ", "ㄵ", "ㄶ", "ㄺ",
        "ㄻ", "ㄼ", "ㄽ", "ㄾ",
        "ㄿ", "ㅀ", "ㅄ"
    ]
    
    static fileprivate let 쌍받침: Set<Character> = ["ㄲ", "ㅆ"]
    
    static func transform13And14th(currentSyllable: Syllable, nextSyllable: Syllable) -> (Syllable, Syllable) {
        let 제13_14항주요조건_충족 = (currentSyllable.jongseong != nil) && nextSyllable.choseong == "ㅇ"
        guard 제13_14항주요조건_충족 else { return (currentSyllable, nextSyllable) }
        
        var (updatedCurrent, updatedNext) = (currentSyllable, nextSyllable)
        
        (updatedCurrent, updatedNext) = handle홀받침or쌍받침(current: updatedCurrent, next: updatedNext)
        (updatedCurrent, updatedNext) = handle겹받침(current: updatedCurrent, next: updatedNext)
        
        return (updatedCurrent, updatedNext)
    }

    static fileprivate func handle홀받침or쌍받침(current: Syllable, next: Syllable) -> (Syllable, Syllable) {
        guard current.jongseong != "ㅇ" && current.has홀받침 || current.has쌍받침 else { return (current, next) }
        
        let updatedCurrent = Syllable(choseong: current.choseong,
                                      jungseong: current.jungseong)
        let updatedNext = Syllable(choseong: current.jongseong!,
                                   jungseong: next.jungseong,
                                   jongseong: next.jongseong)
        
        return (updatedCurrent, updatedNext)
    }
    
    static fileprivate func handle겹받침(current: Syllable, next: Syllable) -> (Syllable, Syllable) {
        guard current.has겹받침 else { return (current, next) }
        
        let ㅅ겹받침: Set<Character> = ["ㄳ", "ㄽ", "ㅄ"]
        let currentJongseong = Hangul.DisassembledConsonants[current.jongseong]!
 
        let updatedCurrent = Syllable(choseong: current.choseong,
                                      jungseong: current.jungseong,
                                      jongseong: currentJongseong[0])
        
        let updatedNextChoseong: Character = ㅅ겹받침.contains(current.jongseong!) ? "ㅆ" : currentJongseong[1]
        
        let updatedNext = Syllable(choseong: updatedNextChoseong,
                                   jungseong: next.jungseong,
                                   jongseong: next.jongseong)
        
        return (updatedCurrent, updatedNext)
    }

}

extension Hangul.Syllable {
    fileprivate var has홀받침: Bool {
        guard let jongseong = self.jongseong else { return false }
        
        return Hangul.홀받침.contains(jongseong)
    }
    
    fileprivate var has겹받침: Bool {
        guard let jongseong = self.jongseong else { return false }
        
        return Hangul.겹받침.contains(jongseong)
    }
    
    fileprivate var has쌍받침: Bool {
        guard let jongseong = self.jongseong else { return false }
        
        return Hangul.쌍받침.contains(jongseong)
    }
}
