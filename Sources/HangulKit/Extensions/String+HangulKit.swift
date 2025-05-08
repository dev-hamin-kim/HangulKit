//
//  String+HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 3/12/25.
//

import Foundation

extension String: HangulKitCompatible { }

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
    ///
    ///     let apple = "사과".hk.getChoseong()
    ///     print(apple) // prints "ㅅㄱ"
    ///
    ///     let spacing = "띄어 쓰기".hk.getChoseong()
    ///     print(spacing) // prints "ㄸㅇ ㅆㄱ"
    public func getChoseong() -> String {
        return HangulKit.getChoseong(base)
    }
    
    /// 문자열 뒤에 선택한 조사 옵션 중 규칙에 알맞은 조사를 붙여 반환합니다.
    ///
    ///     let 샴푸에조사추가 = "샴푸".hk.addJosa(within: .이_가)
    ///     print(샴푸에조사추가) // prints "샴푸가"
    ///
    ///     let 칫솔에조사추가 = "칫솔".hk.addJosa(within: .이_가)
    ///     print(칫솔에조사추가) // prints "칫솔이"
    ///
    /// - Parameters:
    ///     - options: `word` 뒤에 붙일 조사의 선택지이며, enum ``Hangul/JosaOption`` 중 하나 선택 가능
    public func addJosa(within options: HangulKit.JosaOption) -> String {
        return HangulKit.addJosa(after: base, within: options)
    }
    
    /// 문자열에 뒤따를 선택한 조사 옵션 중 규칙에 알맞은 조사를 반환합니다.
    ///
    ///     let 샴푸 = "샴푸".hk.pickJosa(within: .이_가)
    ///     print(샴푸) // prints "가"
    ///
    ///     let 칫솔 = "칫솔".hk.pickJosa(within: .이_가)
    ///     print(칫솔) // prints "이"
    ///
    /// - Parameters:
    ///     - options: `word` 뒤에 붙일 조사의 선택지이며, enum ``JosaOption`` 중 하나 선택 가능
    public func pickJosa(within options: HangulKit.JosaOption) -> String {
        return HangulKit.pickJosa(of: base, within: options)
    }
    
    /// 한글 문자열에서 가장 마지막 문자 하나를 제거하여 반환합니다.
    ///
    ///     "안녕하세요 값".hk.removeLastCharacter() // returns "안녕하세요 갑"
    ///     "아이오에스".hk.removeLastCharacter() // returns "아이오에ㅅ"
    ///     "일요일".hk.removeLastCharacter() // returns "일요이"
    ///     "전화".hk.removeLastCharacter() // returns "전호"
    ///     "신세계".hk.removeLastCharacter() // returns "신세ㄱ"
    public func removeLastCharacter() -> String {
        return HangulKit.removeLastCharacter(base)
    }
    
    /// 두벌식 한글 자판에서 입력된 한글을 QWERTY 자판과 매칭되는 영어 알파벳으로 변환합니다.
    ///
    ///     "겨노".hk.convertHangulToQwerty(); // returns "rush"
    ///     "쨰ㅉ".hk.convertHangulToQwerty(); // returns "WOW"
    ///     "iOS개발!".hk.convertHangulToQwerty(); // returns "iOSroqkf!"
    ///     "ㅇPdml".hk.convertHangulToQwerty(); // returns "dPdml"
    ///     "".hk.convertHangulToQwerty(); // returns ""
    public func convertHangulToQWERTY() -> String {
        return HangulKit.convertHangulToQWERTY(base)
    }
    
    /// QWERTY 자판에서 입력된 영어 알파벳을 동일한 위치의 두벌식 자판에 해당하는 한글 음소로 변환합니다.
    ///
    ///     "dkdldh에스".hk.convertQWERTYToAlphabet() // returns "ㅇㅏㅇㅣㅇㅗ에스"
    ///     "RㅏㄱEㅜrl".hk.convertQWERTYToAlphabet() // returns "ㄲㅏㄱㄸㅜㄱㅣ"
    public func convertQWERTYToAlphabet() -> String {
        return HangulKit.convertQWERTYToAlphabet(base)
    }
    
    /// QWERTY 자판에서 입력된 영어 알파벳을 동일한 위치의 두벌식 자판에 해당하는 한글 음소로 변환한 후 온전한 한글 문자와 문장으로 변환합니다.
    ///
    ///     "abc".hk.convertQWERTYToHangul() // returns "뮻"
    ///     "ABC".hk.convertQWERTYToHangul() // also returns "뮻"
    ///
    ///     "dkdldhdptm".hk.convertQWERTYToHangul() // returns "아이오에스"
    ///     "dkdl오에스".hk.convertQWERTYToHangul() // also returns "아이오에스"
    public func convertQWERTYToHangul() -> String {
        return HangulKit.convertQWERTYToHangul(base)
    }
    
    /// 날짜를 나타내는 숫자 문자열을 순 우리말 날짜로 변환해줍니다.
    /// 1부터 30까지만 지원합니다.
    ///
    ///     "1".hk.days() // returns "하루"
    ///     "3".hk.days() // returns "사흘"
    ///     "10".hk.days() // returns "열흘"
    ///     "30".hk.days() // returns "서른날"
    public func days() -> String {
        guard let input = Int(base), 1...30 ~= input else { return "" }
        
        return HangulKit.days(input)
    }

    /// 숫자 문자열을 한글 서수사로 변환합니다.
    ///
    ///     "1".hk.seosusa() // returns "첫째"
    ///     "2".hk.seosusa() // returns "둘째"
    ///     "3".hk.seosusa() // returns "셋째"
    ///     "10".hk.seosusa() // returns "열째"
    ///     "11".hk.seosusa() // returns "열한째"
    ///     "12".hk.seosusa() // returns "열두째"
    ///     "13".hk.seosusa() // returns "열셋째"
    ///     "20".hk.seosusa() // returns "스무째"
    ///     "21".hk.seosusa() // returns "스물한째"
    ///     "30".hk.seosusa() // returns "서른째"
    ///     "40".hk.seosusa() // returns "마흔째"
    ///     "99".hk.seosusa() // returns "아흔아홉째"
    ///     "100".hk.seosusa() // returns "백째"
    ///
    /// - Note:
    /// - `서수사`는 순서를 나타내는 단어입니다.
    /// - 1부터 99까지의 정수는 순우리말 서수사 문자열로 변환합니다.
    /// - 100 이상의 정수는 한자어 서수사 문자열로 변환합니다.
    public func seosusa() -> String {
        guard let input = Int(base) else { return "" }
        
        return HangulKit.seosusa(of: input)
    }
    
    /// 숫자 문자열을 순 우리말 수사로 변환합니다. 주어진 숫자가 0보다 크고 100이하일 때 유효합니다.
    ///
    ///     "1".hk.susa() // returns "하나"
    ///     "2".hk.susa() // returns "둘"
    ///     "11".hk.susa() // returns "열하나"
    ///     "21".hk.susa() // returns "스물하나"
    ///     "99".hk.susa() // returns "아흔아홉"
    ///     "100".hk.susa() // returns "백"
    ///     "1".hk.susa(classifier: true) // returns "한"
    ///     "2".hk.susa(classifier: true) // returns "두"
    ///     "11".hk.susa(classifier: true) // returns "열한"
    ///     "20".hk.susa(classifier: true) // returns "스무"
    ///     "21".hk.susa(classifier: true) // returns "스물한"
    ///
    /// - Parameters:
    ///     - classifier: 수관형사를 사용할지 여부를 입력합니다. 기본값은 false입니다.
    ///
    /// - Note:
    /// - `수사`란 숫자를 나타내는 우리말 단어입니다. [자세히 알아보기](https://ko.dict.naver.com/#/entry/koko/d0ce2b674cae4b44b9028f648dd458b0)
    /// - `수관형사`는 사물의 수나 양을 나타내는 관형사입니다. "두 사람"의 "두", "세 근"의 "세" 따위를 뜻합니다. [자세히 알아보기](https://ko.dict.naver.com/#/entry/koko/c513782b82554ff499c80ec616c5b611)
    public func susa(classifier: Bool = false) -> String {
        guard let input = Int(base) else { return "" }
        
        return HangulKit.susa(of: input, classifier: classifier)
    }
}
