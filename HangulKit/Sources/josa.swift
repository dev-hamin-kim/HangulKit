//
//  josa.swift
//  HangulKit
//
//  Created by 김하민 on 4/11/25.
//

public extension Hangul {
    
    enum JosaOption: String {
        // JS/TS에서와는 다르게 Swift에선 변수명에 슬래시(/) 못쓴다...........
        // 이게 최선일까........................
        case 이_가 = "이/가"
        case 을_를 = "을/를"
        case 은_는 = "은/는"
        case 으로_로 = "으로/로"
        case 와_과 = "와/과"
        case 이나_나 = "이나/나"
        case 이란_란 = "이란/란"
        case 아_야 = "아/야"
        case 이랑_랑 = "이랑/랑"
        case 이에요_예요 = "이에요/예요"
        case 으로서_로서 = "으로서/로서"
        case 으로써_로써 = "으로써/로써"
        case 으로부터_로부터 = "으로부터/로부터"
        case 이라_라 = "이라/라"
    }
    
    static let 로_조사: [JosaOption] = [.으로_로, .으로서_로서, .으로써_로써, .으로부터_로부터]
    
    // es-hangul에서의 이름은 josaPicker이지만,
    // Swift에서 주로 봐온 함수 명명 형식이, josa 대신 putJosa라고 할 것 같아서 그렇게 하였다.
    static func addJosa(after word: String, within options: JosaOption) -> String {
        if word.isEmpty { return "" }
        
        return word + pickJosa(of: word, within: options)
    }
    
    // es-hangul에서의 이름은 josaPicker이지만,
    // Swift에서 주로 봐온 함수 명명 형식이, josaPicker 대신 pickJosa라고 할 것 같아서 그렇게 하였다.
    // (Swift API design guidelines에서 본 것 같긴 한데 기억이 안난다. 나중에 추가할 것.)
    static func pickJosa(of word: String, within options: JosaOption) -> String {
        if word.isEmpty { return "" }
        
        let has받침 = Hangul.hasBatchim(word.last!)
        var index = has받침 ? 0 : 1
        
        var is종성ㄹ = false
        
        if has받침 {
            let 종성 = try! Hangul.disassembleCompleteCharacter(word.last!).jongseong!
            
            is종성ㄹ = 종성 == "ㄹ"
        }
        
        let isCaseOf로 = has받침 && is종성ㄹ && Hangul.로_조사.contains(options)
        
        if options == .와_과 || isCaseOf로 {
            index = index == 0 ? 1 : 0
        }
        
        let endsWith이 = word.last == "이"
        
        if options == .이에요_예요 && endsWith이 {
            index = 1
        }
        
        return String(options.rawValue.split(separator: "/")[index])
    }
    
}
