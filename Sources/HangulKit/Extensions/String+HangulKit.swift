//
//  String+HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 3/12/25.
//

import Foundation

extension String: HangulKitCompatible { }

// TODO: 테스트 코드 작성
extension HangulKitWrapper where Base == String {
    
    public func isHangulSyllable() -> Bool {
        let rangeOfHangul = "가"..."힣"
        
        return rangeOfHangul.contains(base)
    }
    
    public func isHangulAlphabet() -> Bool {
        let rangeOfHangulAlphabet = "ㄱ"..."ㅣ"
        
        return rangeOfHangulAlphabet.contains(base)
    }
    
    public func isHangul() -> Bool {
        return base.range(of: "\\p{Hangul}", options: .regularExpression) != nil
    }
    
    /// 단어에서 초성을 추출합니다.
    /// 한글 단어가 아닐 경우 nil을 반환합니다.
    ///
    /// ```swift
    /// let apple = "사과".hk.getChoseong()
    /// print(apple) // prints Optional("ㅅㄱ")
    ///
    /// let spacing = "띄어 쓰기".hk.getChoseong()
    /// print(spacing) // prints Optional("ㄸㅇ ㅆㄱ")
    ///
    /// let english = "english".hk.getChoseong()
    /// print(english) // prints nil
    /// ```
    public func getChoseong() -> String? {
        return HangulKit.getChoseong(of: base)
    }
    
    /// 문자열 뒤에 선택한 조사 옵션 중 규칙에 알맞은 조사를 붙여 반환합니다.
    /// 문자열이 온전한 한글이 아닌 경우 nil을 반환합니다.
    ///
    /// ```swift
    /// let 샴푸에조사추가 = "샴푸".hk.addJosa(within: .이_가)
    /// print(샴푸에조사추가) // prints Optional("샴푸가")
    ///
    /// let 칫솔에조사추가 = "칫솔".hk.addJosa(within: .이_가)
    /// print(칫솔에조사추가) // prints Optional("칫솔이")
    ///
    /// let ㅘ에조사추가 = "ㅘ".hk.addJosa(within: .이_가)
    /// print(ㅘ에조사추가) // prints nil
    ///
    /// let eng에조사추가 = "eng".hk.addJosa(within: .이_가)
    /// print(eng에조사추가) // also prints nil
    /// ```
    ///
    /// - Parameters:
    ///     - options: `word` 뒤에 붙일 조사의 선택지이며, enum ``HangulKit/JosaOption`` 중 하나 선택 가능
    public func addJosa(within options: HangulKit.JosaOption) -> String? {
        return HangulKit.addJosa(after: base, within: options)
    }
    
    /// 문자열에 뒤따를 선택한 조사 옵션 중 규칙에 알맞은 조사를 반환합니다.
    /// 문자열이 온전한 한글이 아닌 경우 nil을 반환합니다.
    ///
    /// ```swift
    /// let 샴푸 = "샴푸".hk.pickJosa(within: .이_가)
    /// print(샴푸) // prints Optional("가")
    ///
    /// let 칫솔 = "칫솔".hk.pickJosa(within: .이_가)
    /// print(칫솔) // prints Optional("이")
    ///
    /// let ㅘ = "ㅘ".hk.pickJosa(within: .이_가)
    /// print(ㅘ) // prints nil
    ///
    /// let eng = "eng".hk.pickJosa(within: .이_가)
    /// print(eng) // also prints nil
    /// ```
    ///
    /// - Parameters:
    ///     - options: `word` 뒤에 붙일 조사의 선택지이며, enum ``HangulKit/JosaOption`` 중 하나 선택 가능
    public func pickJosa(within options: HangulKit.JosaOption) -> String? {
        return HangulKit.pickJosa(of: base, within: options)
    }
    
    /// 한글 문자열에서 가장 마지막 문자 하나를 제거하여 반환합니다.
    ///
    /// ```swift
    /// "안녕하세요 값".hk.removeLastCharacter() // returns "안녕하세요 갑"
    /// "아이오에스".hk.removeLastCharacter() // returns "아이오에ㅅ"
    /// "일요일".hk.removeLastCharacter() // returns "일요이"
    /// "전화".hk.removeLastCharacter() // returns "전호"
    /// "신세계".hk.removeLastCharacter() // returns "신세ㄱ"
    /// ```
    public func removeLastCharacter() -> String {
        return HangulKit.removeLastCharacter(in: base)
    }
    
    /// 두벌식 한글 자판에서 입력된 한글을 QWERTY 자판과 매칭되는 영어 알파벳으로 변환합니다.
    ///
    /// ```swift
    /// "겨노".hk.convertHangulToQwerty() // returns "rush"
    /// "쨰ㅉ".hk.convertHangulToQwerty() // returns "WOW"
    /// "iOS개발!".hk.convertHangulToQwerty() // returns "iOSroqkf!"
    /// "ㅇPdml".hk.convertHangulToQwerty() // returns "dPdml"
    /// "".hk.convertHangulToQwerty() // returns ""
    /// ```
    public func convertHangulToQWERTY() -> String {
        return HangulKit.convertHangulToQWERTY(base)
    }
    
    /// QWERTY 자판에서 입력된 영어 알파벳을 동일한 위치의 두벌식 자판에 해당하는 한글 음소로 변환합니다.
    ///
    /// ```swift
    /// "dkdldh에스".hk.convertQWERTYToAlphabet() // returns "ㅇㅏㅇㅣㅇㅗ에스"
    /// "RㅏㄱEㅜrl".hk.convertQWERTYToAlphabet() // returns "ㄲㅏㄱㄸㅜㄱㅣ"
    /// ```
    public func convertQWERTYToAlphabet() -> String {
        return HangulKit.convertQWERTYToAlphabet(base)
    }
    
    /// QWERTY 자판에서 입력된 영어 알파벳을 동일한 위치의 두벌식 자판에 해당하는 한글 음소로 변환한 후 온전한 한글 문자와 문장으로 변환합니다.
    ///
    /// ```swift
    /// "abc".hk.convertQWERTYToHangul() // returns "뮻"
    /// "ABC".hk.convertQWERTYToHangul() // also returns "뮻"
    ///
    /// "dkdldhdptm".hk.convertQWERTYToHangul() // returns "아이오에스"
    /// "dkdl오에스".hk.convertQWERTYToHangul() // also returns "아이오에스"
    /// ```
    public func convertQWERTYToHangul() -> String {
        return HangulKit.convertQWERTYToHangul(base)
    }
    
    /// 날짜를 나타내는 정수 문자열을 순 우리말 날짜로 변환해줍니다.
    /// 주어진 문자열을 정수로 변환한 결과가 1부터 30까지의 정수가 아니라면 nil을 반환합니다.
    ///
    /// ```swift
    /// "1".hk.days() // returns Optional("하루")
    /// "3".hk.days() // returns Optional("사흘")
    /// "10".hk.days() // returns Optional("열흘")
    /// "30".hk.days() // returns Optional("서른날")
    ///
    /// "0".hk.days() // returns nil
    /// "31".hk.days() // also returns nil
    /// ```
    public func days() -> String? {
        guard let input = Int(base) else { return nil }
        
        return HangulKit.days(input)
    }

    /// 숫자 문자열을 한글 서수사로 변환합니다.
    /// 주어진 문자열을 정수로 변환할 수 없거나, 0 또는 음수인 경우 nil을 반환합니다.
    ///
    /// ```swift
    /// "1".hk.seosusa() // returns Optional("첫째")
    /// "2".hk.seosusa() // returns Optional("둘째")
    /// "3".hk.seosusa() // returns Optional("셋째")
    /// "10".hk.seosusa() // returns Optional("열째")
    /// "11".hk.seosusa() // returns Optional("열한째")
    /// "12".hk.seosusa() // returns Optional("열두째")
    /// "13".hk.seosusa() // returns Optional("열셋째")
    /// "20".hk.seosusa() // returns Optional("스무째")
    /// "21".hk.seosusa() // returns Optional("스물한째")
    /// "30".hk.seosusa() // returns Optional("서른째")
    /// "40".hk.seosusa() // returns Optional("마흔째")
    /// "99".hk.seosusa() // returns Optional("아흔아홉째")
    /// "100".hk.seosusa() // returns Optional("백째")
    ///
    /// "0".hk.seosusa() // returns nil
    /// "-1".hk.seosusa() // also returns nil
    /// ```
    ///
    /// - Note:
    /// - `서수사`는 순서를 나타내는 단어입니다.
    /// - 1부터 99까지의 정수는 순우리말 서수사 문자열로 변환합니다.
    /// - 100 이상의 정수는 한자어 서수사 문자열로 변환합니다.
    public func seosusa() -> String? {
        guard let input = Int(base) else { return nil }
        
        return HangulKit.seosusa(of: input)
    }
    
    /// 숫자 문자열을 순 우리말 수사로 변환합니다.
    /// 주어진 문자열을 숫자로 변환한 것이 0보다 크고 100 이하일 때 유효하며, 범위를 벗어났을 경우, nil을 반환합니다.
    ///
    /// ```swift
    /// "1".hk.susa() // returns Optional("하나")
    /// "2".hk.susa() // returns Optional("둘")
    /// "11".hk.susa() // returns Optional("열하나")
    /// "21".hk.susa() // returns Optional("스물하나")
    /// "99".hk.susa() // returns Optional("아흔아홉")
    /// "100".hk.susa() // returns Optional("백")
    /// "1".hk.susa(classifier: true) // returns Optional("한")
    /// "2".hk.susa(classifier: true) // returns Optional("두")
    /// "11".hk.susa(classifier: true) // returns Optional("열한")
    /// "20".hk.susa(classifier: true) // returns Optional("스무")
    /// "21".hk.susa(classifier: true) // returns Optional("스물한")
    ///
    /// "0".hk.susa() // returns nil
    /// "101".hk.susa() // also returns nil
    /// ```
    ///
    /// - Parameters:
    ///     - classifier: 수관형사를 사용할지 여부를 입력합니다. 기본값은 false입니다.
    ///
    /// - Note:
    /// - `수사`란 숫자를 나타내는 우리말 단어입니다. [자세히 알아보기](https://ko.dict.naver.com/#/entry/koko/d0ce2b674cae4b44b9028f648dd458b0)
    /// - `수관형사`는 사물의 수나 양을 나타내는 관형사입니다. "두 사람"의 "두", "세 근"의 "세" 따위를 뜻합니다. [자세히 알아보기](https://ko.dict.naver.com/#/entry/koko/c513782b82554ff499c80ec616c5b611)
    public func susa(classifier: Bool = false) -> String? {
        guard let input = Int(base) else { return nil }
        
        return HangulKit.susa(of: input, classifier: classifier)
    }
}
