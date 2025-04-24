//
//  standardizePronunciation.swift
//  HangulKit
//
//  Created by 김하민 on 4/21/25.
//

public extension Hangul {
    
    static func standardizePronunciation(_ hangul: String, hardConversion: Bool = true) -> String {
        if hangul.isEmpty { return "" }
        
        func processSyllables(_ syllables: [Syllable], phrase: String, options: Bool) -> [Syllable] {
            var result = syllables
            for i in 0..<result.count {
                let currentSyllable = result[i]
                let nextSyllable = i < result.count - 1 ? result[i + 1] : nil
                
                let parameters = ApplyParameters(currentSyllable: currentSyllable,
                                  nextSyllable: nextSyllable,
                                  index: i,
                                  phrase: phrase,
                                  hardConversion: options)

                let changes = applyRules(parameters: parameters)
                
                result[i] = changes.current
                if let newNext = changes.next, i < result.count - 1 {
                    result[i + 1] = newNext
                }
            }
            return result
        }
        
        let transformHangulPhrase = { (phrase: String, options: Bool) -> String in
            let (nonHangulPhrase, disassembledHangul) = 음절분해(hangulPhrase: phrase)
            let processedSyllables = processSyllables(disassembledHangul, phrase: phrase, options: options)
            
            return assembleChangedHangul(disassembleHangul: processedSyllables, nonHangulPhrase: nonHangulPhrase)
        }
        return transformHangulPhrase(hangul, hardConversion)
    }

    fileprivate struct NonHangul {
        let index: Int
        let syllable: String.Element
    }
    
    static fileprivate func 음절분해(hangulPhrase: String) -> (
        nonHangulPhrases: [NonHangul],
        disassembledHangul: [Syllable]
    ) {
        var nonHangulPhrases: [NonHangul] = []
        var disassembledHangul: [Syllable] = []
        var index = 0
        
        for char in hangulPhrase {
            guard isHangulCharacter(char) else {
                nonHangulPhrases.append(.init(index: index, syllable: char))
                index += 1
                continue
            }
            
            let syllable = try! disassembleCompleteCharacter(char)
            disassembledHangul.append(syllable)
            
            index += 1
        }
        
        return (nonHangulPhrases, disassembledHangul)
    }
    
    fileprivate struct ApplyParameters {
        let currentSyllable: Syllable
        let nextSyllable: Syllable?
        let index: Int
        let phrase: String
        let hardConversion: Bool
    }
    
    static fileprivate func applyRules(
        parameters: ApplyParameters
    ) -> (current: Syllable, next: Syllable?) {
        var (current, next) = (parameters.currentSyllable, parameters.nextSyllable)
        let (index, phrase, hardConversion) = (parameters.index, parameters.phrase, parameters.hardConversion)
        
        if next != nil, hardConversion { next = transformHardConversion(currentSyllable: current, nextSyllable: next!) }
        
        if next != nil {
            (current, next) = transform16th(currentSyllable: current,
                                            nextSyllable: next!,
                                            phrase: phrase,
                                            index: index)
            (current, next) = transform17th(currentSyllable: current, nextSyllable: next!)
            next = transform19th(currentSyllable: current, nextSyllable: next!)
            (current, next) = transformNLAssimilation(currentSyllable: current, nextSyllable: next!)
            current = transform18th(currentSyllable: current, nextSyllable: next!)
            (current, next) = transform20th(currentSyllable: current, nextSyllable: next!)
        }

        (current, next) = transform12th(currentSyllable: current, nextSyllable: next)

        if next != nil { (current, next) = transform13And14th(currentSyllable: current, nextSyllable: next!) }

        current = transform9To11th(currentSyllable: current, nextSyllable: next)

        return (current, next)
    }

    static fileprivate func assembleChangedHangul(
        disassembleHangul: [Syllable],
        nonHangulPhrase: [NonHangul]
    ) -> String {
        var changedSyllables = disassembleHangul.map { combineCharacter($0) }
        
        for item in nonHangulPhrase {
            changedSyllables.insert(item.syllable, at: item.index)
        }
        
        return String(changedSyllables)
    }
    
}
