//
//  transformNLAssimilation.swift
//  HangulKit
//
//  Created by 김하민 on 4/18/25.
//

public extension Hangul {
    
    static func transformNLAssimilation(currentSyllable: Syllable, nextSyllable: Syllable) -> (Syllable, Syllable) {
        // ㄴㄹ이 덧나는 조건을 갖추지 못하면 early return
        guard currentSyllable.jongseong != nil,
              nextSyllable.choseong == "ㅇ",
              ㄴㄹ이_덧나는_후속음절_모음.contains(nextSyllable.jungseong)
        else { return (currentSyllable, nextSyllable) }

        return applyㄴㄹ덧남(current: currentSyllable, next: nextSyllable)
    }
    
    static fileprivate func applyㄴㄹ덧남(current: Syllable, next: Syllable) -> (Syllable, Syllable) {
        guard let currentJongseong = current.jongseong else { return (current, next) }
        
        guard ㄴㄹ이_덧나는_모음.contains(current.jungseong) else {
            // ㄴ/ㄹ이 되기 위한 조건이지만 현재 음절의 중성의 ∙(아래아)가 하나가 아닐 경우에는 덧나지 않고 연음규칙이 적용된다
            let newNext = Syllable(choseong: currentJongseong,
                                   jungseong: next.jungseong,
                                   jongseong: next.jongseong)
            
            return (current, newNext)
        }
        
        var updatedCurrentJongseong: Character = currentJongseong
        var updatedNextChoseong: Character = " "
        
        if ㄴㄹ이_덧나서_받침_ㄴ_변환.contains(currentJongseong) {
            updatedCurrentJongseong = currentJongseong == "ㄱ" ? "ㅇ" : currentJongseong
            updatedNextChoseong = "ㄴ"
        }
        
        if ㄴㄹ이_덧나서_받침_ㄹ_변환 == currentJongseong {
            updatedNextChoseong = "ㄹ"
        }
        
        let updatedCurrent = Syllable(choseong: current.choseong,
                                      jungseong: current.jungseong,
                                      jongseong: updatedCurrentJongseong)
        
        let updatedNext = Syllable(choseong: updatedNextChoseong,
                                   jungseong: next.jungseong,
                                   jongseong: next.jongseong)
        
        return (updatedCurrent, updatedNext)
    }
}
