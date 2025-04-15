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
        let jongseong = currentSyllable.jongseong == "ㅎ" ? nil : currentSyllable.jongseong
        
        return DisassembledCharacter(choseong: choseong, jungseong: jungseong, jongseong: jongseong)
    }
}
