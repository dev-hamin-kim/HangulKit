<!--배지-->
![][license-shield] ![Repository Size][repository-size-shield]

<!--프로젝트 대문 이미지-->

<!--프로젝트 버튼-->
 [![Readme in English][readme-eng-shield]][readme-eng-url] [![Report bug][report-bug-shield]][report-bug-url] [![Request feature][request-feature-shield]][request-feature-url]


<!--Url for Badges-->
[license-shield]: https://img.shields.io/github/license/dev-hamin-kim/HangulKit?labelColor=D8D8D8&color=04B4AE
[repository-size-shield]: https://img.shields.io/github/repo-size/dev-hamin-kim/HangulKit?labelColor=D8D8D8&color=BE81F7

<!--Url for Buttons-->
[readme-eng-shield]: https://img.shields.io/badge/-readme%20in%20English-2E2E2E?style=for-the-badge

[report-bug-shield]: https://img.shields.io/badge/-%F0%9F%90%9E%20report%20bug-F5A9A9?style=for-the-badge
[report-bug-url]: https://github.com/dev-hamin-kim/HangulKit/issues

[request-feature-shield]: https://img.shields.io/badge/-%E2%9C%A8%20request%20feature-A9D0F5?style=for-the-badge
[request-feature-url]: https://github.com/dev-hamin-kim/HangulKit/issues

<!--URLS-->
[license-url]: LICENSE
[readme-eng-url]: /README_en.md

# HangulKit [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdev-hamin-kim%2FHangulKit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/dev-hamin-kim/HangulKit) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdev-hamin-kim%2FHangulKit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/dev-hamin-kim/HangulKit)

HangulKit은 [Toss](https://github.com/toss)의 [es-hangul](https://github.com/toss/es-hangul)에서 영감을 받아,
Swift로 한글을 보다 쉽게 처리할 수 있도록 설계된 라이브러리입니다.  

## 무엇을 할 수 있나요? (HangulKit 101)

- 문자열의 초성 추출하기
  ```swift
  let apple = HangulKit.getChoseong(of: "사과")
  print(apple) // prints Optional("ㅅㄱ")
  ```
  
- 문자열 뒤에 조사 넣기
  ```swift
  let 샴푸에조사추가 = HangulKit.addJosa(after: "샴푸", within: .이_가)
  print(샴푸에조사추가) // prints Optional("샴푸가")
  
  let 칫솔에조사추가 = HangulKit.addJosa(after: "칫솔", within: .이_가)
  print(칫솔에조사추가) // prints Optional("칫솔이")
  ```
  
- 주어진 숫자를 한자어 수사로 바꾸기
  ```swift
  let number = HangulKit.numberToHangul(123_456_780)
  print(number) // prints "일억이천삼백사십오만육천칠백팔십"

  let anotherNumber = HangulKit.numberToHangul(123_456_780, withSpace: true)
  print(anotherNumber) // prints "일억 이천삼백사십오만 육천칠백팔십"

  let decimalNumber = HangulKit.numberToHangul(-12_345.678, withSpace: true)
  print(decimalNumber) // prints Optional("마이너스 일만 이천삼백사십오점 육칠팔")
  ```
  
- 주어진 숫자에 대해 4자리마다 달라지는 한글의 숫자 단위를 자동으로 붙이기 
  ```swift
  let number = HangulKit.numberToHangulMixed(123_456_780)
  print(number) // prints "1억2,345만6,780"

  let anotherNumber = HangulKit.numberToHangulMixed(123_456_780, withSpace: true)
  print(anotherNumber) // prints "1억 2,345만 6,780"

  let decimalNumber = HangulKit.numberToHangulMixed(-12_345.678, withSpace: true)
  print(decimalNumber) // prints Optional("-1만 2,345.678")
  ```

- 숫자를 순 우리말 수사로 변환하거나 수 관형사로 변환하기
  ```swift
  HangulKit.susa(of: 1) // returns Optional("하나")
  HangulKit.susa(of: 2) // returns Optional("둘")
  HangulKit.susa(of: 11) // returns Optional("열하나")
  HangulKit.susa(of: 21) // returns Optional("스물하나")
  ```
  
- 숫자를 한글 서수사로 변환하기.
  ```swift
  HangulKit.seosusa(of: 1) // returns Optional("첫째")
  HangulKit.seosusa(of: 2) // returns Optional("둘째")
  HangulKit.seosusa(of: 3) // returns Optional("셋째")
  HangulKit.seosusa(of: Int.max) // returns Optional("구백이십이경삼천삼백칠십이조삼백육십팔억오천사백칠십칠만오천팔백칠째")
  ```

- 한글 문자열을 로마자 표기로 변경하기
  ```swift
  HangulKit.romanize(hangul: "종로") // returns "jongno"
  HangulKit.romanize(hangul: "한국은korea") // returns "hangugeunkorea"
  HangulKit.romanize(hangul: "고양이는cat") // returns "goyangineuncat"
  ```
<!-- 그 외에도 많은 기능이 있으며, 여기에 Docc 링크 추가?-->

## 어떤 함수들은 옵셔널을 리턴하는데 왜 그런건가요?

HangulKit은 크게 세 가지 상황에서 옵셔널을 리턴합니다:
1. 입력받은 String에서 한글이 아닌 문자열을 받았거나,
2. Float.nan과 같은 예외사항,
3. 메서드가 지원하는 범위가 아닐때.

이와 같은 상황들에 대한 설명은 각 메서드의 주석으로 남겨져 있으니, 사용 시에 참고하시면 되겠습니다.

## 사용해 보고 싶어요! (How to install)

### Swift Package Manager

#### Xcode에서 직접 추가

1. **Xcode를 열고** 상단 메뉴에서 `File` > `Add Package Dependencies...`를 클릭합니다.
2. **패키지 URL 입력란**에 레포지토리 주소를 입력하세요: https://github.com/dev-hamin-kim/HangulKit
3. Enter 키를 누르면 패키지가 검색됩니다.
4. 원하는 버전을 선택하고 `Add Package`를 클릭합니다.

#### Package.swift에 직접 추가 (SwiftPM 프로젝트의 경우)

Swift 패키지 프로젝트를 사용 중이라면 `Package.swift` 파일에 아래 내용을 추가하세요:

```swift
dependencies: [
 .package(url: "https://github.com/dev-hamin-kim/HangulKit", from: "1.0.0")
 // 실제 사용 시에는 from: "1.0.0" 대신 GitHub 저장소에서 지원하는 최신 버전을 확인하여 지정하세요.
],
targets: [
 .target(
     name: "YourTargetName",
     dependencies: ["HangulKit"]
 )
]
```

## 또 다른 사용법 (Usage)
몇몇 메서드들은 Swift의 기본 타입에 .hk 익스텐션을 거쳐서 사용이 가능합니다.
(RxSwift, Kingfisher, SnapKit 등을 사용하셨다면 익숙하실 방법입니다.)

- 예시
```swift
let apple = "사과".hk.getChoseong()
print(apple) // prints Optional("ㅅㄱ")
```

자세한 사용방법은 DocC(링크 추가 필요)를 참고해주세요.

## 감사의 말 (Acknowledgements)

- [Toss](https://github.com/toss)의 [es-hangul](https://github.com/toss/es-hangul)
- [Img Shields](https://shields.io/)

## 문의 (Contact)

질문이나 제안이 있다면 Issue를 생성하거나 [@dev-hamin-kim](https://github.com/dev-hamin-kim)에게 연락해 주세요.
