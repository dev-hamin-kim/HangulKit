//
//  String+HangulKitTests.swift
//  HangulKit
//
//  Created by 김하민 on 5/26/25.
//

import Testing
@testable import HangulKit

struct StringHanguKitExtensionlTests {
    
    struct getChoseongTests {
        @Test("'사과' 단어에서 초성 'ㅅㄱ'을 추출한다.")
        func getChoseong1() {
            #expect("사과".hk.getChoseong() == "ㅅㄱ")
        }
        
        @Test("'아이오에스' 단어에서 초성 'ㅇㅇㅇㅇㅅ'를 추출한다.")
        func getChoseong2() {
            #expect("아이오에스".hk.getChoseong() == "ㅇㅇㅇㅇㅅ")
        }
        
        @Test("'프론트엔드' 문자에서 초성 'ㅍㄹㅌㅇㄷ'를 추출한다.")
        func getChoseong3() {
            #expect("프론트엔드".hk.getChoseong() == "ㅍㄹㅌㅇㄷ")
        }
        
        @Test("'ㄴㅈ' 문자에서 초성 'ㄴㅈ'를 추출한다.")
        func getChoseong4() {
            #expect("ㄴㅈ".hk.getChoseong() == "ㄴㅈ")
        }
        
        @Test("'유아이킷' 단어에서 초성 'ㅇㅇㅇㅋ'를 추출한다.")
        func getChoseong5() {
            #expect("유아이킷".hk.getChoseong() == "ㅇㅇㅇㅋ")
        }
        
        @Test("'리액트' 단어에서 초성 'ㄹㅇㅌ'를 추출한다.")
        func getChoseong6() {
            #expect("리액트".hk.getChoseong() == "ㄹㅇㅌ")
        }
        
        @Test("'띄어 쓰기' 단어에서 초성 'ㄸㅇ ㅆㄱ'를 추출한다.")
        func getChoseong7() {
            #expect("띄어 쓰기".hk.getChoseong() == "ㄸㅇ ㅆㄱ")
        }
        
        @Test("한글 단어가 아닐 경우 nil을 반환한다.")
        func getChoseong8() {
            #expect("english".hk.getChoseong() == nil)
        }
    }
    
    struct addJosaTests {
        
        @Test("주격조사")
        func addJosa1() {
            #expect("샴푸".hk.addJosa(within: .이_가) == "샴푸가")
            #expect("칫솔".hk.addJosa(within: .이_가) == "칫솔이")
        }
        
        @Test("목적격조사")
        func addJosa2() {
            #expect("샴푸".hk.addJosa(within: .을_를) == "샴푸를")
            #expect("칫솔".hk.addJosa(within: .을_를) == "칫솔을")
        }

        @Test("대조의 보조사")
        func addJosa3() {
            #expect("샴푸".hk.addJosa(within: .은_는) == "샴푸는")
            #expect("칫솔".hk.addJosa(within: .은_는) == "칫솔은")
        }

        @Test("방향의 격조사")
        func addJosa4() {
            #expect("바깥".hk.addJosa(within: .으로_로) == "바깥으로")
            #expect("내부".hk.addJosa(within: .으로_로) == "내부로")
        }
        
        @Test("방향의 격조사 ㄹ 받침 예외 처리")
        func addJosa5() {
            #expect("지름길".hk.addJosa(within: .으로_로) == "지름길로")
        }
        
        @Test("비교의 격조사")
        func addJosa6() {
            #expect("샴푸".hk.addJosa(within: .와_과) == "샴푸와")
            #expect("칫솔".hk.addJosa(within: .와_과) == "칫솔과")
        }
        
        @Test("선택의 보조사")
        func addJosa7() {
            #expect("샴푸".hk.addJosa(within: .이나_나) == "샴푸나")
            #expect("칫솔".hk.addJosa(within: .이나_나) == "칫솔이나")
        }
        
        @Test("화제의 보조사")
        func addJosa8() {
            #expect("샴푸".hk.addJosa(within: .이란_란) == "샴푸란")
            #expect("칫솔".hk.addJosa(within: .이란_란) == "칫솔이란")
        }
        
        @Test("호격조사")
        func addJosa9() {
            #expect("철수".hk.addJosa(within: .아_야) == "철수야")
            #expect("길동".hk.addJosa(within: .아_야) == "길동아")
        }
        
        @Test("접속조사")
        func addJosa10() {
            #expect("고기".hk.addJosa(within: .이랑_랑) == "고기랑")
            #expect("과일".hk.addJosa(within: .이랑_랑) == "과일이랑")
        }
        
        @Test("주제의 보조사")
        func addJosa11() {
            #expect("의사".hk.addJosa(within: .이라_라) == "의사라")
            #expect("선생님".hk.addJosa(within: .이라_라) == "선생님이라")
        }
        
        @Test("서술격조사와 종결어미")
        func addJosa12() {
            #expect("사과".hk.addJosa(within: .이에요_예요) == "사과예요")
            #expect("책".hk.addJosa(within: .이에요_예요) == "책이에요")
        }
        
        @Test("서술격조사와 종결어미, '이' 로 끝나는 단어 예외 처리")
        func addJosa13() {
            #expect("때밀이".hk.addJosa(within: .이에요_예요) == "때밀이예요")
        }

        @Test("지위나 신분 또는 자격을 나타내는 위격조사")
        func addJosa14() {
            #expect("학생".hk.addJosa(within: .으로서_로서) == "학생으로서")
            #expect("부모".hk.addJosa(within: .으로서_로서) == "부모로서")
        }
        
        @Test("지위나 신분 또는 자격을 나타내는 위격조사 ㄹ 받침 예외 처리")
        func addJosa15() {
            #expect("라이벌".hk.addJosa(within: .으로서_로서) == "라이벌로서")
        }
        
        @Test("수단의 의미를 나타내는 도구격조사")
        func addJosa16() {
            #expect("토큰".hk.addJosa(within: .으로써_로써) == "토큰으로써")
            #expect("함수".hk.addJosa(within: .으로써_로써) == "함수로써")
        }

        @Test("수단의 의미를 나타내는 도구격조사 ㄹ 받침 예외 처리")
        func addJosa17() {
            #expect("건물".hk.addJosa(within: .으로써_로써) == "건물로써")
        }
        
        @Test("어떤 행동의 출발점이나 비롯되는 대상임을 나타내는 격 조사")
        func addJosa18() {
            #expect("역삼동".hk.addJosa(within: .으로부터_로부터) == "역삼동으로부터")
            #expect("저기".hk.addJosa(within: .으로부터_로부터) == "저기로부터")
        }

        @Test("어떤 행동의 출발점이나 비롯되는 대상임을 나타내는 격 조사 ㄹ 받침 예외 처리")
        func addJosa19() {
            #expect("동굴".hk.addJosa(within: .으로부터_로부터) == "동굴로부터")
        }
        
        @Test("단어가 빈 문자열일 경우 nil을 반환한다.")
        func addJosa20() {
            #expect("".hk.addJosa(within: .이_가) == nil)
        }
    }

    struct pickJosaTests {
        
        @Test("단어가 빈 문자열이라면 nil을 반환한다.")
        func pickJosa1() {
            #expect("".hk.pickJosa(within: .이_가) == nil)
        }
        
        @Test("주격조사")
        func pickJosa2() {
            #expect("샴푸".hk.pickJosa(within: .이_가) == "가")
            #expect("칫솔".hk.pickJosa(within: .이_가) == "이")
        }
        
        @Test("목적격조사")
        func pickJosa3() {
            #expect("샴푸".hk.pickJosa(within: .을_를) == "를")
            #expect("칫솔".hk.pickJosa(within: .을_를) == "을")
        }
        
        @Test("대조의 보조사")
        func pickJosa4() {
            #expect("샴푸".hk.pickJosa(within: .은_는) == "는")
            #expect("칫솔".hk.pickJosa(within: .은_는) == "은")
        }
        
        @Test("방향의 격조사")
        func pickJosa5() {
            #expect("바깥".hk.pickJosa(within: .으로_로) == "으로")
            #expect("내부".hk.pickJosa(within: .으로_로) == "로")
        }
        
        @Test("방향의 격조사 ㄹ 받침 예외 처리")
        func pickJosa6() {
            #expect("지름길".hk.pickJosa(within: .으로_로) == "로")
        }
        
        @Test("비교의 격조사")
        func pickJosa7() {
            #expect("샴푸".hk.pickJosa(within: .와_과) == "와")
            #expect("칫솔".hk.pickJosa(within: .와_과) == "과")
        }
        
        @Test("선택의 보조사")
        func pickJosa8() {
            #expect("샴푸".hk.pickJosa(within: .이나_나) == "나")
            #expect("칫솔".hk.pickJosa(within: .이나_나) == "이나")
        }
        
        @Test("화제의 보조사")
        func pickJosa9() {
            #expect("샴푸".hk.pickJosa(within: .이란_란) == "란")
            #expect("칫솔".hk.pickJosa(within: .이란_란) == "이란")
        }
        
        @Test("호격조사")
        func pickJosa10() {
            #expect("철수".hk.pickJosa(within: .아_야) == "야")
            #expect("길동".hk.pickJosa(within: .아_야) == "아")
        }
        
        @Test("접속조사")
        func pickJosa11() {
            #expect("고기".hk.pickJosa(within: .이랑_랑) == "랑")
            #expect("과일".hk.pickJosa(within: .이랑_랑) == "이랑")
        }
        
        @Test("서술격조사와 종결어미")
        func pickJosa12() {
            #expect("사과".hk.pickJosa(within: .이에요_예요) == "예요")
            #expect("책".hk.pickJosa(within: .이에요_예요) == "이에요")
        }

        @Test("서술격조사와 종결어미, '이' 로 끝나는 단어 예외 처리")
        func pickJosa13() {
            #expect("때밀이".hk.pickJosa(within: .이에요_예요) == "예요")
        }

        @Test("지위나 신분 또는 자격을 나타내는 위격조사")
        func pickJosa14() {
            #expect("학생".hk.pickJosa(within: .으로서_로서) == "으로서")
            #expect("부모".hk.pickJosa(within: .으로서_로서) == "로서")
        }
        
        @Test("지위나 신분 또는 자격을 나타내는 위격조사 ㄹ 받침 예외 처리")
        func pickJosa15() {
            #expect("라이벌".hk.pickJosa(within: .으로서_로서) == "로서")
        }
        
        @Test("수단의 의미를 나타내는 도구격조사")
        func pickJosa16() {
            #expect("토큰".hk.pickJosa(within: .으로써_로써) == "으로써")
            #expect("함수".hk.pickJosa(within: .으로써_로써) == "로써")
        }
        
        @Test("수단의 의미를 나타내는 도구격조사 ㄹ 받침 예외 처리")
        func pickJosa17() {
            #expect("건물".hk.pickJosa(within: .으로써_로써) == "로써")
        }
        
        @Test("어떤 행동의 출발점이나 비롯되는 대상임을 나타내는 격 조사")
        func pickJosa18() {
            #expect("역삼동".hk.pickJosa(within: .으로부터_로부터) == "으로부터")
            #expect("저기".hk.pickJosa(within: .으로부터_로부터) == "로부터")
        }

        @Test("어떤 행동의 출발점이나 비롯되는 대상임을 나타내는 격 조사 ㄹ 받침 예외 처리")
        func pickJosa19() {
            #expect("동굴".hk.pickJosa(within: .으로부터_로부터) == "로부터")
        }

    }

    struct SeosusaTests {
        @Test("순 우리말 서수사로 변환한다.")
        func test1() async throws {
            let validNumbers: [(num: String, word: String?)] = [
                ("1", "첫째"),
                ("2", "둘째"),
                ("3", "셋째"), // '셋째'가 표준어이고 '세째'는 비표준어이다.(표준어 사정 원칙 제6항)
                ("4", "넷째"), // '넷째'가 표준어이고 '네째'는 비표준어이다.(표준어 사정 원칙 제6항)
                ("5", "다섯째"),
                ("6", "여섯째"),
                ("7", "일곱째"),
                ("8", "여덟째"),
                ("9", "아홉째"),
                ("10", "열째"),
                ("11", "열한째"),
                ("12", "열두째"), // '둘째'는 십 단위 이상의 서수사에 쓰일 때에 '두째'로 한다.(표준어 사정 원칙 제6항)
                ("13", "열셋째"),
                ("14", "열넷째"),
                ("15", "열다섯째"),
                ("20", "스무째"),
                ("21", "스물한째"),
                ("22", "스물두째"),
                ("30", "서른째"),
                ("40", "마흔째"),
                ("90", "아흔째"),
                ("99", "아흔아홉째"),
                ("100", "백째"),
                ("101", "백일째"),
//                (String(Int.max), "구백이십이경삼천삼백칠십이조삼백육십팔억오천사백칠십칠만오천팔백칠째"),
            ]
            
            for (input, output) in validNumbers {
                #expect(input.hk.seosusa() == output)
            }
        }
        
        @Test("유효하지 않은 숫자에 대해 nil을 반환하여야 한다.")
        func test2() async throws {
            let input = ["0", "-1", /*String(Int.min)*/]
            
            input.forEach { input in
                #expect(input.hk.seosusa() == nil)
            }
        }
    }
    
}
