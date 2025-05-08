//
//  transformHardConversion.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

extension HangulKit {
    static func transformHardConversion(currentSyllable: Syllable, nextSyllable: Syllable) -> Syllable {
        guard let currentJonseong = currentSyllable.jongseong,
              let updatedNextChoseong = 된소리[nextSyllable.choseong] else { return nextSyllable }
        
        let 제23항조건_충족 = 된소리_받침.contains(currentJonseong)
        let 제24_25항조건_충족 = 어간_받침.contains(currentJonseong) && nextSyllable.choseong != "ㅂ"
        
        guard 제23항조건_충족 || 제24_25항조건_충족 else { return nextSyllable }
        
        return Syllable(choseong: updatedNextChoseong,
                        jungseong: nextSyllable.jungseong,
                        jongseong: nextSyllable.jongseong)
    }
}
