//
//  transform9To11th.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

public extension Hangul {
    static func transform9To11th(currentSyllable: Syllable, nextSyllable: Syllable?) -> Syllable {
        guard let currentJongseong = currentSyllable.jongseong else { return currentSyllable }
        
        let is어말 = nextSyllable == nil
        let is음가있는자음앞 = nextSyllable?.choseong != "ㅇ"
        let newJongseong = 받침_대표음_발음[currentJongseong]
        
        let 제9_10_11항주요조건 = (is어말 || is음가있는자음앞)
        
        guard 제9_10_11항주요조건, let newJongseong else { return currentSyllable }
        
        return Syllable(choseong: currentSyllable.choseong,
                        jungseong: currentSyllable.jungseong,
                        jongseong: newJongseong)
    }
}
