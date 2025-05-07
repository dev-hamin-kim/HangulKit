//
//  transform18th.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

public extension Hangul {
    
    static func transform18th(currentSyllable: Syllable, nextSyllable: Syllable) -> Syllable {
        let 제18항주요조건_충족 = ["ㄴ", "ㅁ"].contains(nextSyllable.choseong)
        
        guard let currentJongseong = currentSyllable.jongseong,
              제18항주요조건_충족 else { return currentSyllable }
        
        var newJongseong: Character = currentJongseong
        
        if 비음화_받침_ㅇ_변환.contains(currentJongseong) { newJongseong = "ㅇ" }
        if 비음화_받침_ㄴ_변환.contains(currentJongseong) { newJongseong = "ㄴ" }
        if 비음화_받침_ㅁ_변환.contains(currentJongseong) { newJongseong = "ㅁ" }
        
        let current = Syllable(choseong: currentSyllable.choseong,
                               jungseong: currentSyllable.jungseong,
                               jongseong: newJongseong)
        
        return current
    }
    
}
