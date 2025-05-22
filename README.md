<!--배지-->
![][license-shield] ![Repository Size][repository-size-shield]

<!--Swift Package Index Compatibility Badges-->
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdev-hamin-kim%2FHangulKit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/dev-hamin-kim/HangulKit) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdev-hamin-kim%2FHangulKit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/dev-hamin-kim/HangulKit)

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

# HangulKit

HangulKit은 [Toss](https://github.com/toss)의 [es-hangul](https://github.com/toss/es-hangul)에서 영감을 받아,
Swift로 한글을 보다 쉽게 처리할 수 있도록 설계된 라이브러리입니다.  

## 기능 (Features)

### Core
- 문자열 뒤에 조사 넣기/고르기

### Number
- 날짜를 나타내는 숫자를 순 우리말 날짜로 변환하기
- 주어진 숫자를 한자어 수사로 바꾸기
- 주어진 숫자에 대해 4자리마다 달라지는 한글의 숫자 단위를 자동으로 붙이기
- 숫자를 순 우리말 수사로 변환하거나 수 관형사로 변환하기
- 숫자를 순우리말 날로 바꿔줍니다

### Pronunciation
- 한글 문자열을 표준 발음법으로 변경하기
- 한글 문자열을 로마자 표기로 변경하기


<!-- 그 외에도 많은 기능이 있으며, 여기에 Docc 링크 추가?-->

## 설치 (Installation)

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

#### CocoaPods (개발 중)

## 사용법 (Usage)

(추후 추가 예정)

## 감사의 말 (Acknowledgements)

- [Toss](https://github.com/toss)의 [es-hangul](https://github.com/toss/es-hangul)
- [Img Shields](https://shields.io/)

## 문의 (Contact)

질문이나 제안이 있다면 Issue를 생성하거나 [@dev-hamin-kim](https://github.com/dev-hamin-kim)에게 연락해 주세요.
