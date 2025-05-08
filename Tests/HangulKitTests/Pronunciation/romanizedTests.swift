//
//  romanizedTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/23/25.
//

import Testing
@testable import HangulKit

struct romanizedTests {
    
    @Test("자음 사이에서 동화 작용이 일어나는 경우")
    func test1() async throws {
        let input = ["백마", "종로", "왕십리", "별래", "신라"]
        let output = ["baengma", "jongno", "wangsimni", "byeollae", "silla"]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.romanize(hangul: input) == output)
        }
    }
    
    @Test("ㄴ, ㄹ’이 덧나는 경우")
    func test2() async throws {
        let input = ["학여울", "알약"]
        let output = ["hangnyeoul", "allyak"]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.romanize(hangul: input) == output)
        }
    }
    
    @Test("구개음화가 되는 경우")
    func test3() async throws {
        let input = ["해돋이", "같이", "굳히다"]
        let output = ["haedoji", "gachi", "guchida"]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.romanize(hangul: input) == output)
        }
    }
    
    @Test("'ㄱ, ㄷ, ㅂ, ㅈ'이 'ㅎ'과 합하여 거센소리로 소리 나는 경우")
    func test4() async throws {
        let input = ["좋고", "놓다", "잡혀", "낳지"]
        let output = ["joko", "nota", "japyeo", "nachi"]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.romanize(hangul: input) == output)
        }
    }
    
    @Test("된소리되기는 표기에 반영하지 않는다")
    func test5() async throws {
        let input = ["압구정", "낙동강", "죽변", "낙성대", "합정", "팔당", "샛별", "울산"]
        let output = ["apgujeong", "nakdonggang", "jukbyeon", "nakseongdae", "hapjeong", "paldang", "saetbyeol", "ulsan"]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.romanize(hangul: input) == output)
        }
    }
    
    @Test("'ㄱ, ㄷ, ㅂ'은 모음 앞에서는 'g, d, b'로, 자음 앞이나 어말에서는 'k, t, p'로 적는다")
    func test6() async throws {
        let input = ["구미", "영동", "백암", "옥천", "합덕", "호법", "월곶", "벚꽃", "한밭"]
        let output = ["gumi", "yeongdong", "baegam", "okcheon", "hapdeok", "hobeop", "wolgot", "beotkkot", "hanbat"]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.romanize(hangul: input) == output)
        }
    }
    
    @Test("'ㄹ'은 모음 앞에서는 'r'로, 자음 앞이나 어말에서는 'l'로 적는다. 단, 'ㄹㄹ'은 'll'로 적는다")
    func test7() async throws {
        let input = ["구리", "설악", "칠곡", "임실", "울릉", "대관령"]
        let output = ["guri", "seorak", "chilgok", "imsil", "ulleung", "daegwallyeong"]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.romanize(hangul: input) == output)
        }
    }

    @Test("완성된 음절이 아닌 경우에는 그대로 반환한다")
    func test8() async throws {
        let input = ["ㄱ", "가나다라ㅁㅂㅅㅇ", "ㅏ", "ㅘ"]
        let output = ["g", "ganadarambs", "a", "wa"]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.romanize(hangul: input) == output)
        }
    }
    
    @Test("특수문자는 로마자 표기로 변경하지 않는다")
    func test9() async throws {
        let input = ["안녕하세요.", "한국어!", "!?/", ""]
        let output = ["annyeonghaseyo.", "hangugeo!", "!?/", ""]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.romanize(hangul: input) == output)
        }
    }
    
    @Test("한글과 영어가 혼합된 경우에는 영어는 그대로 반환된다")
    func test10() async throws {
        let input = ["안녕하세요 es-hangul", "한국은korea", "고양이는cat"]
        let output = ["annyeonghaseyo es-hangul", "hangugeunkorea", "goyangineuncat"]
        
        for (input, output) in zip(input, output) {
            #expect(HangulKit.romanize(hangul: input) == output)
        }
    }
}
