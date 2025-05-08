//
//  transform19th.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

extension HangulKit {
    
    static func transform19th(currentSyllable: Syllable, nextSyllable: Syllable) -> Syllable {
        guard let currentJongseong = currentSyllable.jongseong else { return nextSyllable }
        
        let 제19항조건_충족 = 자음동화_받침_ㄴ_변환.contains(currentJongseong) && nextSyllable.choseong == "ㄹ"
        
        guard 제19항조건_충족 else { return nextSyllable }
        
        return Syllable(choseong: "ㄴ",
                        jungseong: nextSyllable.jungseong,
                        jongseong: nextSyllable.jongseong)
    }

}
