//
//  Array+HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 5/9/25.
//

extension Array: HangulKitCompatible { }

// TODO: 테스트 코드 작성
extension HangulKitWrapper where Base == Array<String> {
    /// 배열에 담긴 한글 문장과 문자를 한글 규칙에 맞게 합성합니다.
    ///
    ///     var 아버지가 = ["아버지가", " ", "방ㅇ", "ㅔ ", 들ㅇ", "ㅓ갑니다"]
    ///     아버지가.hk.assemble() // returns "아버지가 방에 들어갑니다"
    ///
    ///     아버지가 = ["아버지가", " ", "방에 ", "들어갑니다"]
    ///     아버지가.hk.assemble() // also returns "아버지가 방에 들어갑니다"
    ///
    ///     let 아버지 = ["ㅇ", "ㅏ", "ㅂ", "ㅓ", "ㅈ", "ㅣ"]
    ///     아버지.hk.assemble() // returns "아버지"
    public func assemble() -> String {
        return HangulKit.assemble(base)
    }
}

extension HangulKitWrapper where Base == Array<Character> {
    /// 배열에 담긴 한글 문자를 한글 규칙에 맞게 합성합니다.
    ///
    ///     let 아버지가: [Character] = [
    ///     "아", "버", "지", "가", " ",
    ///     "방", "에", " ",
    ///     "들", "어", "갑", "니", "다"
    ///     ]
    ///     아버지가.hk.assemble() // returns "아버지가 방에 들어갑니다"
    ///
    ///     let 아버지: [Character] = ["ㅇ", "ㅏ", "ㅂ", "ㅓ", "ㅈ", "ㅣ"]
    ///     아버지.hk.assemble( // returns "아버지"
    public func assemble() -> String {
        return HangulKit.assemble(base)
    }
}
