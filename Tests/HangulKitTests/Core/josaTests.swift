//
//  josaTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/11/25.
//

import Testing
@testable import HangulKit

struct addJosaTests {
    
    @Test("주격조사")
    func addJosa1() {
        #expect(HangulKit.addJosa(after: "샴푸", within: .이_가) == "샴푸가")
        #expect(HangulKit.addJosa(after: "칫솔", within: .이_가) == "칫솔이")
    }
    
    @Test("목적격조사")
    func addJosa2() {
        #expect(HangulKit.addJosa(after: "샴푸", within: .을_를) == "샴푸를")
        #expect(HangulKit.addJosa(after: "칫솔", within: .을_를) == "칫솔을")
    }

    @Test("대조의 보조사")
    func addJosa3() {
        #expect(HangulKit.addJosa(after: "샴푸", within: .은_는) == "샴푸는")
        #expect(HangulKit.addJosa(after: "칫솔", within: .은_는) == "칫솔은")
    }

    @Test("방향의 격조사")
    func addJosa4() {
        #expect(HangulKit.addJosa(after: "바깥", within: .으로_로) == "바깥으로")
        #expect(HangulKit.addJosa(after: "내부", within: .으로_로) == "내부로")
    }
    
    @Test("방향의 격조사 ㄹ 받침 예외 처리")
    func addJosa5() {
        #expect(HangulKit.addJosa(after: "지름길", within: .으로_로) == "지름길로")
    }
    
    @Test("비교의 격조사")
    func addJosa6() {
        #expect(HangulKit.addJosa(after: "샴푸", within: .와_과) == "샴푸와")
        #expect(HangulKit.addJosa(after: "칫솔", within: .와_과) == "칫솔과")
    }
    
    @Test("선택의 보조사")
    func addJosa7() {
        #expect(HangulKit.addJosa(after: "샴푸", within: .이나_나) == "샴푸나")
        #expect(HangulKit.addJosa(after: "칫솔", within: .이나_나) == "칫솔이나")
    }
    
    @Test("화제의 보조사")
    func addJosa8() {
        #expect(HangulKit.addJosa(after: "샴푸", within: .이란_란) == "샴푸란")
        #expect(HangulKit.addJosa(after: "칫솔", within: .이란_란) == "칫솔이란")
    }
    
    @Test("호격조사")
    func addJosa9() {
        #expect(HangulKit.addJosa(after: "철수", within: .아_야) == "철수야")
        #expect(HangulKit.addJosa(after: "길동", within: .아_야) == "길동아")
    }
    
    @Test("접속조사")
    func addJosa10() {
        #expect(HangulKit.addJosa(after: "고기", within: .이랑_랑) == "고기랑")
        #expect(HangulKit.addJosa(after: "과일", within: .이랑_랑) == "과일이랑")
    }
    
    @Test("주제의 보조사")
    func addJosa11() {
        #expect(HangulKit.addJosa(after: "의사", within: .이라_라) == "의사라")
        #expect(HangulKit.addJosa(after: "선생님", within: .이라_라) == "선생님이라")
    }
    
    @Test("서술격조사와 종결어미")
    func addJosa12() {
        #expect(HangulKit.addJosa(after: "사과", within: .이에요_예요) == "사과예요")
        #expect(HangulKit.addJosa(after: "책", within: .이에요_예요) == "책이에요")
    }
    
    @Test("서술격조사와 종결어미, '이' 로 끝나는 단어 예외 처리")
    func addJosa13() {
        #expect(HangulKit.addJosa(after: "때밀이", within: .이에요_예요) == "때밀이예요")
    }

    @Test("지위나 신분 또는 자격을 나타내는 위격조사")
    func addJosa14() {
        #expect(HangulKit.addJosa(after: "학생", within: .으로서_로서) == "학생으로서")
        #expect(HangulKit.addJosa(after: "부모", within: .으로서_로서) == "부모로서")
    }
    
    @Test("지위나 신분 또는 자격을 나타내는 위격조사 ㄹ 받침 예외 처리")
    func addJosa15() {
        #expect(HangulKit.addJosa(after: "라이벌", within: .으로서_로서) == "라이벌로서")
    }
    
    @Test("수단의 의미를 나타내는 도구격조사")
    func addJosa16() {
        #expect(HangulKit.addJosa(after: "토큰", within: .으로써_로써) == "토큰으로써")
        #expect(HangulKit.addJosa(after: "함수", within: .으로써_로써) == "함수로써")
    }

    @Test("수단의 의미를 나타내는 도구격조사 ㄹ 받침 예외 처리")
    func addJosa17() {
        #expect(HangulKit.addJosa(after: "건물", within: .으로써_로써) == "건물로써")
    }
    
    @Test("어떤 행동의 출발점이나 비롯되는 대상임을 나타내는 격 조사")
    func addJosa18() {
        #expect(HangulKit.addJosa(after: "역삼동", within: .으로부터_로부터) == "역삼동으로부터")
        #expect(HangulKit.addJosa(after: "저기", within: .으로부터_로부터) == "저기로부터")
    }

    @Test("어떤 행동의 출발점이나 비롯되는 대상임을 나타내는 격 조사 ㄹ 받침 예외 처리")
    func addJosa19() {
        #expect(HangulKit.addJosa(after: "동굴", within: .으로부터_로부터) == "동굴로부터")
    }
    
    @Test("단어가 빈 문자열일 경우 nil을 반환한다.")
    func addJosa20() {
        #expect(HangulKit.addJosa(after: "", within: .이_가) == nil)
    }
}

struct pickJosaTests {
    
    @Test("첫 번째 매개변수가 빈 문자열이라면 nil을 반환한다.")
    func pickJosa1() {
        #expect(HangulKit.pickJosa(of: "", within: .이_가) == nil)
    }
    
    @Test("주격조사")
    func pickJosa2() {
        #expect(HangulKit.pickJosa(of: "샴푸", within: .이_가) == "가")
        #expect(HangulKit.pickJosa(of: "칫솔", within: .이_가) == "이")
    }
    
    @Test("목적격조사")
    func pickJosa3() {
        #expect(HangulKit.pickJosa(of: "샴푸", within: .을_를) == "를")
        #expect(HangulKit.pickJosa(of: "칫솔", within: .을_를) == "을")
    }
    
    @Test("대조의 보조사")
    func pickJosa4() {
        #expect(HangulKit.pickJosa(of: "샴푸", within: .은_는) == "는")
        #expect(HangulKit.pickJosa(of: "칫솔", within: .은_는) == "은")
    }
    
    @Test("방향의 격조사")
    func pickJosa5() {
        #expect(HangulKit.pickJosa(of: "바깥", within: .으로_로) == "으로")
        #expect(HangulKit.pickJosa(of: "내부", within: .으로_로) == "로")
    }
    
    @Test("방향의 격조사 ㄹ 받침 예외 처리")
    func pickJosa6() {
        #expect(HangulKit.pickJosa(of: "지름길", within: .으로_로) == "로")
    }
    
    @Test("비교의 격조사")
    func pickJosa7() {
        #expect(HangulKit.pickJosa(of: "샴푸", within: .와_과) == "와")
        #expect(HangulKit.pickJosa(of: "칫솔", within: .와_과) == "과")
    }
    
    @Test("선택의 보조사")
    func pickJosa8() {
        #expect(HangulKit.pickJosa(of: "샴푸", within: .이나_나) == "나")
        #expect(HangulKit.pickJosa(of: "칫솔", within: .이나_나) == "이나")
    }
    
    @Test("화제의 보조사")
    func pickJosa9() {
        #expect(HangulKit.pickJosa(of: "샴푸", within: .이란_란) == "란")
        #expect(HangulKit.pickJosa(of: "칫솔", within: .이란_란) == "이란")
    }
    
    @Test("호격조사")
    func pickJosa10() {
        #expect(HangulKit.pickJosa(of: "철수", within: .아_야) == "야")
        #expect(HangulKit.pickJosa(of: "길동", within: .아_야) == "아")
    }
    
    @Test("접속조사")
    func pickJosa11() {
        #expect(HangulKit.pickJosa(of: "고기", within: .이랑_랑) == "랑")
        #expect(HangulKit.pickJosa(of: "과일", within: .이랑_랑) == "이랑")
    }
    
    @Test("서술격조사와 종결어미")
    func pickJosa12() {
        #expect(HangulKit.pickJosa(of: "사과", within: .이에요_예요) == "예요")
        #expect(HangulKit.pickJosa(of: "책", within: .이에요_예요) == "이에요")
    }

    @Test("서술격조사와 종결어미, '이' 로 끝나는 단어 예외 처리")
    func pickJosa13() {
        #expect(HangulKit.pickJosa(of: "때밀이", within: .이에요_예요) == "예요")
    }

    @Test("지위나 신분 또는 자격을 나타내는 위격조사")
    func pickJosa14() {
        #expect(HangulKit.pickJosa(of: "학생", within: .으로서_로서) == "으로서")
        #expect(HangulKit.pickJosa(of: "부모", within: .으로서_로서) == "로서")
    }
    
    @Test("지위나 신분 또는 자격을 나타내는 위격조사 ㄹ 받침 예외 처리")
    func pickJosa15() {
        #expect(HangulKit.pickJosa(of: "라이벌", within: .으로서_로서) == "로서")
    }
    
    @Test("수단의 의미를 나타내는 도구격조사")
    func pickJosa16() {
        #expect(HangulKit.pickJosa(of: "토큰", within: .으로써_로써) == "으로써")
        #expect(HangulKit.pickJosa(of: "함수", within: .으로써_로써) == "로써")
    }
    
    @Test("수단의 의미를 나타내는 도구격조사 ㄹ 받침 예외 처리")
    func pickJosa17() {
        #expect(HangulKit.pickJosa(of: "건물", within: .으로써_로써) == "로써")
    }
    
    @Test("어떤 행동의 출발점이나 비롯되는 대상임을 나타내는 격 조사")
    func pickJosa18() {
        #expect(HangulKit.pickJosa(of: "역삼동", within: .으로부터_로부터) == "으로부터")
        #expect(HangulKit.pickJosa(of: "저기", within: .으로부터_로부터) == "로부터")
    }

    @Test("어떤 행동의 출발점이나 비롯되는 대상임을 나타내는 격 조사 ㄹ 받침 예외 처리")
    func pickJosa19() {
        #expect(HangulKit.pickJosa(of: "동굴", within: .으로부터_로부터) == "로부터")
    }

}
