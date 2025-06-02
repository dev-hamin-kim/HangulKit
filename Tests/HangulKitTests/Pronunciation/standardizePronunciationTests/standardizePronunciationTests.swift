//
//  standardizePronunciationTests.swift
//  HangulKit
//
//  Created by 김하민 on 4/21/25.
//

#if swift(>=5.10)
import Testing
@testable import HangulKit

struct standardizePronunciationTests {

    @Suite("음절이 완성된 한글을 제외한 문자는 변경하지 않는다")
    struct NonHangul {
        @Test("단일 자모는 그대로 반환한다.")
        func incompleteHangul() async throws {
            #expect(HangulKit.standardizePronunciation("ㄱㄴㄷㄹㅏㅓㅑㅙ") == "ㄱㄴㄷㄹㅏㅓㅑㅙ")
        }
        
        @Test("특수문자는 그대로 반환한다.")
        func symbols() async throws {
            #expect(HangulKit.standardizePronunciation("!?") == "!?")
        }
        
        @Test("영어는 그대로 반환한다.")
        func english() async throws {
            #expect(HangulKit.standardizePronunciation("hello") == "hello")
        }
        
        @Test("숫자는 그대로 반환한다.")
        func numbers() async throws {
            #expect(HangulKit.standardizePronunciation("1234567890") == "1234567890")
        }
        
        @Test("빈 문자열은 그대로 반환한다.")
        func emptyString() async throws {
            #expect(HangulKit.standardizePronunciation("") == "")
        }
    }

    
    @Suite("제16항")
    struct 제16항 {
        @Test("'ㄷ, ㅈ, ㅊ, ㅋ, ㅌ, ㅍ, ㅎ'의 경우에는 특별히 다음과 같이 발음한다")
        func test() {
            // 한글 자모의 이름은 그 받침소리를 연음하되, 'ㄷ, ㅈ, ㅊ, ㅋ, ㅌ, ㅍ, ㅎ'의 경우에는 특별히 다음과 같이 발음한다
            #expect(HangulKit.standardizePronunciation("디귿이") == "디그시")
            #expect(HangulKit.standardizePronunciation("지읒이") == "지으시")
            #expect(HangulKit.standardizePronunciation("치읓이") == "치으시")
            #expect(HangulKit.standardizePronunciation("키읔이") == "키으기")
            #expect(HangulKit.standardizePronunciation("티읕이") == "티으시")
            #expect(HangulKit.standardizePronunciation("피읖이") == "피으비")
            #expect(HangulKit.standardizePronunciation("히읗이") == "히으시")
            
            // 자모의 이름이 'ㄱ, ㄴ, ㄹ, ㅁ, ㅂ, ㅅ, ㅇ'일 경우
            #expect(HangulKit.standardizePronunciation("기역이") == "기여기")
            #expect(HangulKit.standardizePronunciation("니은이") == "니으니")
            #expect(HangulKit.standardizePronunciation("리을이") == "리으리")
            #expect(HangulKit.standardizePronunciation("미음이") == "미으미")
            #expect(HangulKit.standardizePronunciation("비읍이") == "비으비")
            #expect(HangulKit.standardizePronunciation("이응이") == "이응이")
        }
    }
    
    @Test("한글은 음성 표기법으로 변경한다")
    func test2() {
        // TODO: 테스트 코드 리팩터링
        
        // MARK: - 제17항
        // 제받침 "ㄷ", "ㅌ(ㄾ)"이 조사나 접미사의 모음 "ㅣ"와 결합되는 경우에는, "ㅈ", "ㅊ"으로 바꾸어서 뒤 음절 첫소리로 옮겨 발음한다
        #expect(HangulKit.standardizePronunciation("곧이듣다") == "고지듣따")
        #expect(HangulKit.standardizePronunciation("굳이") == "구지")
        #expect(HangulKit.standardizePronunciation("미닫이") == "미다지")
        #expect(HangulKit.standardizePronunciation("땀받이") == "땀바지")
        #expect(HangulKit.standardizePronunciation("밭이") == "바치")
        #expect(HangulKit.standardizePronunciation("벼훑이") == "벼훌치")
        
        // "ㄷ" 뒤에 접미사 "히"가 결합되어 "티"를 이루는 것은 "치"로 발음한다
        #expect(HangulKit.standardizePronunciation("굳히다") == "구치다")
        #expect(HangulKit.standardizePronunciation("닫히다") == "다치다")
        #expect(HangulKit.standardizePronunciation("묻히다") == "무치다")
        
        // MARK: - "ㄴ/ㄹ"이 덧나는 경우
        // 받침이 "ㄱ, ㄴ, ㄷ, ㅁ, ㅂ, ㅇ"이고 다음 음절이 "야, 여, 요, 유, 이, 얘, 예"로 이어지는 경우
        #expect(HangulKit.standardizePronunciation("학여울") == "항녀울")
        #expect(HangulKit.standardizePronunciation("맨입") == "맨닙")
        #expect(HangulKit.standardizePronunciation("담요") == "담뇨")
        #expect(HangulKit.standardizePronunciation("영업용") == "영엄뇽")
        #expect(HangulKit.standardizePronunciation("콩엿") == "콩녇")
        #expect(HangulKit.standardizePronunciation("알약") == "알략")
        
        // 받침이 "ㄹ"이고 다음 음절이 "야, 여, 요, 유, 이, 얘, 예"로 이어지는 경우
        #expect(HangulKit.standardizePronunciation("알약") == "알략")
        #expect(HangulKit.standardizePronunciation("서울역") == "서울력")
        #expect(HangulKit.standardizePronunciation("불여우") == "불려우")
        
        // ㄴ/ㄹ이 되기 위한 조건이지만 현재 음절의 중성의 ∙(아래아)가 하나가 아닐 경우에는 덧나지 않고 연음규칙이 적용된다
        #expect(HangulKit.standardizePronunciation("고양이") == "고양이")
        #expect(HangulKit.standardizePronunciation("윤여정") == "윤녀정")
        
        // MARK: - 제19항
        // 받침 "ㅁ, ㅇ" 뒤에 연결되는 "ㄹ"은 "ㄴ"으로 발음한다
        #expect(HangulKit.standardizePronunciation("담력") == "담녁")
        #expect(HangulKit.standardizePronunciation("침략") == "침냑")
        #expect(HangulKit.standardizePronunciation("강릉") == "강능")
        #expect(HangulKit.standardizePronunciation("항로") == "항노")
        #expect(HangulKit.standardizePronunciation("대통령") == "대통녕")
        
        // 받침 "ㄱ, ㅂ" 뒤에 연결되는 "ㄹ"도 "ㄴ"으로 발음한다
        #expect(HangulKit.standardizePronunciation("막론") == "망논")
        #expect(HangulKit.standardizePronunciation("석류") == "성뉴")
        #expect(HangulKit.standardizePronunciation("협력") == "혐녁")
        #expect(HangulKit.standardizePronunciation("법리") == "범니")
        
        // MARK: - 제18항: 받침 "ㄱ, ㄲ, ㅋ, ㄳ, ㄺ" / "ㄷ, ㅅ, ㅆ, ㅈ, ㅊ, ㅌ, ㅎ" / "ㅂ, ㅍ, ㄼ, ㄿ, ㅄ"은 "ㄴ, ㅁ" 앞에서 "ㅇ, ㄴ, ㅁ"으로 발음한다
        // '받침 "ㄱ, ㄲ, ㅋ, ㄳ, ㄺ"일 경우'
        #expect(HangulKit.standardizePronunciation("먹는") == "멍는")
        #expect(HangulKit.standardizePronunciation("깎는") == "깡는")
        #expect(HangulKit.standardizePronunciation("키읔만") == "키응만")
        #expect(HangulKit.standardizePronunciation("몫몫이") == "몽목씨")
        #expect(HangulKit.standardizePronunciation("긁는") == "긍는")

        // 받침 "ㄷ, ㅅ, ㅆ, ㅈ, ㅊ, ㅌ, ㅎ"일 경우
        #expect(HangulKit.standardizePronunciation("닫는") == "단는")
        #expect(HangulKit.standardizePronunciation("짓는") == "진는")
        #expect(HangulKit.standardizePronunciation("있는") == "인는")
        #expect(HangulKit.standardizePronunciation("맞는") == "만는")
        #expect(HangulKit.standardizePronunciation("쫓는") == "쫀는")
        #expect(HangulKit.standardizePronunciation("붙는") == "분는")
        #expect(HangulKit.standardizePronunciation("놓는") == "논는")

        // 받침 "ㅂ, ㅍ, ㄼ, ㄿ, ㅄ"일 경우
        #expect(HangulKit.standardizePronunciation("잡는") == "잠는")
        #expect(HangulKit.standardizePronunciation("앞마당") == "암마당")
        #expect(HangulKit.standardizePronunciation("밟는") == "밤는")
        #expect(HangulKit.standardizePronunciation("읊는") == "음는")
        #expect(HangulKit.standardizePronunciation("없는") == "엄는")
        
        // MARK: - 제20항
        // "ㄴ"은 "ㄹ"의 앞이나 뒤에서 "ㄹ"로 발음한다
        #expect(HangulKit.standardizePronunciation("난로") == "날로")
        #expect(HangulKit.standardizePronunciation("신라") == "실라")
        #expect(HangulKit.standardizePronunciation("천리") == "철리")
        #expect(HangulKit.standardizePronunciation("대관령") == "대괄령")
        #expect(HangulKit.standardizePronunciation("칼날") == "칼랄")
        
        // 첫소리 "ㄴ"이 "ㅀ, ㄾ" 뒤에 연결되는 경우에도 "ㄹ"로 발음한다
        #expect(HangulKit.standardizePronunciation("닳는") == "달른")
        #expect(HangulKit.standardizePronunciation("핥네") == "할레")
        
        // MARK: - 제12항
        // "ㅎ, ㄶ, ㅀ" 뒤에 "ㄱ, ㄷ, ㅈ"이 결합되는 경우에는, 뒤 음절 첫소리와 합쳐서 "ㅋ, ㅌ, ㅊ"으로 발음한다
        #expect(HangulKit.standardizePronunciation("놓고") == "노코")
        #expect(HangulKit.standardizePronunciation("좋던") == "조턴")
        #expect(HangulKit.standardizePronunciation("쌓지") == "싸치")
        #expect(HangulKit.standardizePronunciation("많고") == "만코")
        #expect(HangulKit.standardizePronunciation("않던") == "안턴")
        #expect(HangulKit.standardizePronunciation("닳지") == "달치")
        
        // 받침 "ㄱ, ㄺ, ㄷ, ㅂ, ㄼ, ㅈ, ㄵ"이 뒤 음절 첫소리 "ㅎ"과 결합되는 경우에도, 역시 두 음을 합쳐서 "ㅋ, ㅌ, ㅍ, ㅊ"으로 발음한다
        #expect(HangulKit.standardizePronunciation("각하") == "가카")
        #expect(HangulKit.standardizePronunciation("먹히다") == "머키다")
        #expect(HangulKit.standardizePronunciation("밝히다") == "발키다")
        #expect(HangulKit.standardizePronunciation("맏형") == "마텽")
        #expect(HangulKit.standardizePronunciation("좁히다") == "조피다")
        #expect(HangulKit.standardizePronunciation("넓히다") == "널피다")
        #expect(HangulKit.standardizePronunciation("꽂히다") == "꼬치다")
        #expect(HangulKit.standardizePronunciation("앉히다") == "안치다")
        
        // "ㅎ, ㄶ, ㅀ" 뒤에 "ㅅ"이 결합되는 경우에는, "ㅅ"을 "ㅆ"으로 발음한다
        #expect(HangulKit.standardizePronunciation("닿소") == "다쏘")
        #expect(HangulKit.standardizePronunciation("많소") == "만쏘")
        #expect(HangulKit.standardizePronunciation("싫소") == "실쏘")
        
        // "ㅎ" 뒤에 "ㄴ"이 결합되는 경우에는 "ㄴ"으로 발음한다
        #expect(HangulKit.standardizePronunciation("놓는") == "논는")
        #expect(HangulKit.standardizePronunciation("쌓네") == "싼네")
        
        // "ㄶ, ㅀ" 뒤에 "ㄴ"이 결합되는 경우에는, "ㅎ"을 발음하지 않는다
        #expect(HangulKit.standardizePronunciation("않네") == "안네")
        #expect(HangulKit.standardizePronunciation("않는") == "안는")
        #expect(HangulKit.standardizePronunciation("뚫네") == "뚤레")
        #expect(HangulKit.standardizePronunciation("뚫는") == "뚤른")
        
        // "ㅎ, ㄶ, ㅀ" 뒤에 모음으로 시작된 어미나 접미사가 결합되는 경우에는 "ㅎ"을 발음하지 않는다
        #expect(HangulKit.standardizePronunciation("낳은") == "나은")
        #expect(HangulKit.standardizePronunciation("놓아") == "노아")
        #expect(HangulKit.standardizePronunciation("쌓이다") == "싸이다")
        #expect(HangulKit.standardizePronunciation("많아") == "마나")
        #expect(HangulKit.standardizePronunciation("않은") == "아는")
        #expect(HangulKit.standardizePronunciation("닳아") == "다라")
        #expect(HangulKit.standardizePronunciation("싫어도") == "시러도")
        
        // 다음 음절이 없는 경우
        #expect(HangulKit.standardizePronunciation("많") == "만")
        #expect(HangulKit.standardizePronunciation("싫") == "실")
        
        // MARK: - 제13항
        // 홑받침이나 쌍받침이 모음으로 시작된 조사나 어미, 접미사와 결합되는 경우에는, 제 음가대로 뒤 음절 첫소리로 옮겨 발음한다
        #expect(HangulKit.standardizePronunciation("깎아") == "까까")
        #expect(HangulKit.standardizePronunciation("옷이") == "오시")
        #expect(HangulKit.standardizePronunciation("있어") == "이써")
        #expect(HangulKit.standardizePronunciation("낮이") == "나지")
        #expect(HangulKit.standardizePronunciation("앞으로") == "아프로")
        
        // MARK: - 제14항
        // 겹받침이 모음으로 시작된 조사나 어미, 접미사와 결합되는 경우에는, 뒤엣것만을 뒤 음절 첫소리로 옮겨 발음한다
        #expect(HangulKit.standardizePronunciation("닭을") == "달글")
        #expect(HangulKit.standardizePronunciation("젊어") == "절머")
        #expect(HangulKit.standardizePronunciation("곬이") == "골씨")
        #expect(HangulKit.standardizePronunciation("핥아") == "할타")
    }
    
    @Suite("제9항")
    struct NinthRule {
        @Test("받침 'ㄲ, ㅋ' / 'ㅅ, ㅆ, ㅈ, ㅊ, ㅌ' / 'ㅍ'은 어말 또는 자음 앞에서 각각 대표음 'ㄱ, ㄷ, ㅂ'으로 발음한다")
        func test() async throws {
            #expect(HangulKit.standardizePronunciation("닦다") == "닥따")
            #expect(HangulKit.standardizePronunciation("키읔") == "키윽")
            
            #expect(HangulKit.standardizePronunciation("옷") == "옫")
            #expect(HangulKit.standardizePronunciation("있다") == "읻따")
            #expect(HangulKit.standardizePronunciation("젖") == "젇")
            #expect(HangulKit.standardizePronunciation("빚다") == "빋따")
            #expect(HangulKit.standardizePronunciation("꽃") == "꼳")
            #expect(HangulKit.standardizePronunciation("솥") == "솓")
            
            #expect(HangulKit.standardizePronunciation("앞") == "압")
            #expect(HangulKit.standardizePronunciation("덮다") == "덥따")
        }
    }
    
    @Suite("제10항")
    struct RuleNo10 {
        @Test("겹받침 'ㄳ' / 'ㄵ' / 'ㄼ, ㄽ, ㄾ' / 'ㅄ'은 어말 또는 자음 앞에서 각각 'ㄱ, ㄴ, ㄹ, ㅂ'으로 발음한다")
        func test() async throws {
            #expect(HangulKit.standardizePronunciation("넋") == "넉")
            
            #expect(HangulKit.standardizePronunciation("앉다") == "안따")
            
            #expect(HangulKit.standardizePronunciation("여덟") == "여덜")
            #expect(HangulKit.standardizePronunciation("외곬") == "외골")
            #expect(HangulKit.standardizePronunciation("핥다") == "할따")
            
            #expect(HangulKit.standardizePronunciation("값") == "갑")
        }
    }
    
    @Suite("제11항")
    struct RuleNo11 {
        @Test("겹받침 'ㄺ' / 'ㄻ' / 'ㄿ'은 어말 또는 자음 앞에서 각각 'ㄱ, ㅁ, ㅂ'으로 발음한다")
        func test() async throws {
            #expect(HangulKit.standardizePronunciation("닭") == "닥")
            #expect(HangulKit.standardizePronunciation("맑다") == "막따")
            
            #expect(HangulKit.standardizePronunciation("삶") == "삼")
            #expect(HangulKit.standardizePronunciation("젊다") == "점따")
            
            #expect(HangulKit.standardizePronunciation("읊고") == "읍꼬")
            #expect(HangulKit.standardizePronunciation("읊다") == "읍따")
        }
    }
    
    @Suite("제23항")
    struct RuleNo23 {
        @Test("받침 'ㄱ(ㄲ, ㅋ, ㄳ, ㄺ), ㄷ(ㅅ, ㅆ, ㅈ, ㅊ, ㅌ), ㅂ(ㅍ, ㄼ, ㄿ, ㅄ)' 뒤에 연결되는 'ㄱ, ㄷ, ㅂ, ㅅ, ㅈ'은 된소리로 발음한다")
        func test() async throws {
            #expect(HangulKit.standardizePronunciation("국밥") == "국빱")
            #expect(HangulKit.standardizePronunciation("깎다") == "깍따")
            #expect(HangulKit.standardizePronunciation("넋받이") == "넉빠지")
            #expect(HangulKit.standardizePronunciation("삯돈") == "삭똔")
        }
    }
    
    @Suite("제24항")
    struct RuleNo24 {
        @Test("어간 받침 'ㄴ(ㄵ), ㅁ(ㄻ)' 뒤에 결합되는 어미의 첫소리 'ㄱ, ㄷ, ㅅ, ㅈ'은 된소리로 발음한다")
        func test() async throws {
            #expect(HangulKit.standardizePronunciation("신고") == "신꼬")
            #expect(HangulKit.standardizePronunciation("껴안다") == "껴안따")
            #expect(HangulKit.standardizePronunciation("앉고") == "안꼬")
            #expect(HangulKit.standardizePronunciation("얹다") == "언따")
            #expect(HangulKit.standardizePronunciation("삼고") == "삼꼬")
            #expect(HangulKit.standardizePronunciation("더듬지") == "더듬찌")
            #expect(HangulKit.standardizePronunciation("닮고") == "담꼬")
            #expect(HangulKit.standardizePronunciation("젊지") == "점찌")
        }
    }
    
    @Suite("제25항")
    struct RuleNo25 {
        @Test("어간 받침 'ㄼ, ㄾ' 뒤에 결합되는 어미의 첫소리 'ㄱ, ㄷ, ㅅ, ㅈ'은 된소리로 발음한다")
        func test() async throws {
            #expect(HangulKit.standardizePronunciation("넓게") == "널께")
            #expect(HangulKit.standardizePronunciation("핥다") == "할따")
            #expect(HangulKit.standardizePronunciation("훑소") == "훌쏘")
            #expect(HangulKit.standardizePronunciation("떫지") == "떨찌")
        }
    }
    
    @Suite("경음화 등의 된소리를 적용하지 않는다")
    struct HardConversion {
        @Test("제9항")
        func test9() async throws {
            #expect(HangulKit.standardizePronunciation("닦다", hardConversion: false) == "닥다")
        }
        
        @Test("제10항")
        func test10() async throws {
            #expect(HangulKit.standardizePronunciation("앉다", hardConversion: false) == "안다")
        }
        
        @Test("제11항")
        func test11() async throws {
            #expect(HangulKit.standardizePronunciation("맑다", hardConversion: false) == "막다")
        }
        
        @Test("제11항")
        func test17() async throws {
            #expect(HangulKit.standardizePronunciation("곧이듣다", hardConversion: false) == "고지듣다")
        }
        
        @Test("제23항")
        func test23() async throws {
            #expect(HangulKit.standardizePronunciation("국밥", hardConversion: false) == "국밥")
        }
        
        @Test("제24항")
        func test24() async throws {
            #expect(HangulKit.standardizePronunciation("신고", hardConversion: false) == "신고")
        }
        
        @Test("제25항")
        func test25() async throws {
            #expect(HangulKit.standardizePronunciation("넓게", hardConversion: false) == "널게")
        }
    }
    
//    @Suite("")
//    struct bugs {
//        @Test func test() async throws {
//            #expect(HangulKit.standardizePronunciation("전역") == "저녁")
//            #expect(HangulKit.standardizePronunciation("전 역") == "전 녁")
//            #expect(HangulKit.standardizePronunciation("힘듦") == "힘듬")
//            #expect(HangulKit.standardizePronunciation("힘듦이 있다") == "힘드미 읻따")
//        }
//    }
}

#endif
