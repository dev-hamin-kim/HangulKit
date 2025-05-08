//
//  josa.swift
//  HangulKit
//
//  Created by 김하민 on 4/11/25.
//

public extension HangulKit {
    
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
    
    static internal let 로_조사: [JosaOption] = [.으로_로, .으로서_로서, .으로써_로써, .으로부터_로부터]
    
    // es-hangul에서의 이름은 josa이지만,
    // Swift에서 주로 봐온 함수 명명 형식이, josa 대신 putJosa라고 할 것 같아서 그렇게 하였다.
    
    /// 입력된 문자열 뒤에 선택한 조사 옵션 중 규칙에 알맞은 조사를 붙여 반환합니다.
    ///
    ///     let 샴푸에조사추가 = HangulKit.addJosa(after: "샴푸", within: .이_가)
    ///     print(샴푸에조사추가) // prints "샴푸가"
    ///
    ///     let 칫솔에조사추가 = HangulKit.addJosa(after: "칫솔", within: .이_가)
    ///     print(칫솔에조사추가) // prints "칫솔이"
    ///
    /// - Parameters:
    ///     - word: 조사를 붙일 문자열
    ///     - options: `word` 뒤에 붙일 조사의 선택지이며, enum ``JosaOption`` 중 하나 선택 가능
    static func addJosa(after word: String, within options: JosaOption) -> String {
        if word.isEmpty { return "" }
        
        return word + pickJosa(of: word, within: options)
    }
    
    // es-hangul에서의 이름은 josaPicker이지만,
    // Swift에서 주로 봐온 함수 명명 형식이, josaPicker 대신 pickJosa라고 할 것 같아서 그렇게 하였다.
    // (Swift API design guidelines에서 본 것 같긴 한데 기억이 안난다. 나중에 추가할 것.)
    
    /// 입력된 문자열에 뒤따를 선택한 조사 옵션 중 규칙에 알맞은 조사를 반환합니다.
    ///
    ///     let 샴푸 = HangulKit.pickJosa(of: "샴푸", within: .이_가)
    ///     print(샴푸) // prints "가"
    ///
    ///     let 칫솔 = HangulKit.pickJosa(of: "칫솔", within: .이_가)
    ///     print(칫솔) // prints "이"
    ///
    /// - Parameters:
    ///     - word: 조사를 판단할 문자열
    ///     - options: `word` 뒤에 붙일 조사의 선택지이며, enum ``JosaOption`` 중 하나 선택 가능
    static func pickJosa(of word: String, within options: JosaOption) -> String {
        if word.isEmpty { return options.rawValue.components(separatedBy: "/")[0] }
        
        let has받침 = HangulKit.hasBatchim(word.last!)
        var index = has받침 ? 0 : 1
        
        var is종성ㄹ = false
        
        if has받침 {
            let 종성 = try! HangulKit.disassembleCompleteCharacter(word.last!).jongseong!
            
            is종성ㄹ = 종성 == "ㄹ"
        }
        
        let isCaseOf로 = has받침 && is종성ㄹ && HangulKit.로_조사.contains(options)
        
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
