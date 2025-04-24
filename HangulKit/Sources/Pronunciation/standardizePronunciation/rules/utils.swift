//
//  utils.swift
//  HangulKit
//
//  Created by 김하민 on 4/15/25.
//

public extension Hangul {
    
    typealias Syllable = DisassembledCharacter
    
    // es-hangul과 구현방식이 상이함.
    static func replace받침ㅎ(of currentSyllable: Syllable) -> Syllable {
        let choseong = currentSyllable.choseong
        let jungseong = currentSyllable.jungseong
        guard let jongseong = currentSyllable.jongseong else { return Syllable(choseong: choseong,
                                                                               jungseong: jungseong) }
        
        guard 발음변환_받침_ㅎ.contains(jongseong) else { return Syllable(choseong: choseong,
                                                                   jungseong: jungseong,
                                                                   jongseong: jongseong) }
        
        var ㅎInJongseongRemoved: Character?
        
        if jongseong == "ㅎ" { ㅎInJongseongRemoved = nil }
        else if jongseong == "ㅀ" { ㅎInJongseongRemoved = "ㄹ" }
        else if jongseong == "ㄶ" { ㅎInJongseongRemoved = "ㄴ" }
        
        return Syllable(choseong: choseong, jungseong: jungseong, jongseong: ㅎInJongseongRemoved)
    }
}
