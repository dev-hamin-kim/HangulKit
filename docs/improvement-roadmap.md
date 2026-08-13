# HangulKit 개선 로드맵

> 작성일: 2026-08-12  
> 검토 기준: HangulKit `main`의 2025-07-03 커밋과 es-hangul 2.4.0

이 문서는 HangulKit 저장소 검토에서 확인한 개선점을 우선순위별로 정리하고,
이를 실제 작업 단위로 나눈 백로그다. 구현 과정에서 범위나 호환성 정책이
결정되면 각 항목의 완료 조건과 함께 갱신한다.

## 테스트 환경에 관한 정정

검토에 사용한 Mac에서 기본 `swift test`는 다음 오류로 실패했다.

```text
error: no such module 'Testing'
```

하지만 이는 현재 HangulKit의 테스트 코드가 실패한 결과가 아니라 로컬 개발
도구 구성이 불완전해서 발생한 문제로 확인됐다.

- `xcode-select -p`는 전체 Xcode가 아닌
  `/Library/Developer/CommandLineTools`를 가리키고 있었다.
- 설치된 Xcode 앱에는 `Contents/Developer/usr/bin/xcrun`이 없어 전체 Xcode
  개발자 디렉터리로 사용할 수 없는 상태였다.
- Command Line Tools 안에 `Testing.framework`는 존재했지만 SwiftPM이 필요한
  프레임워크 검색 경로와 런타임 경로를 자동으로 구성하지 못했다.
- 검색 경로와 `rpath`를 진단 목적으로 직접 지정했을 때 254개 테스트가 모두
  통과했다.

따라서 `no such module 'Testing'`만을 근거로 `swift-testing` 패키지 의존성을
추가하거나 테스트를 다른 프레임워크로 옮길 필요는 없다. 저장소에서 해결할
문제는 지원하는 Xcode/Swift 환경을 명시하고, 정상적인 전체 Xcode 환경의
CI에서 기본 `swift test`가 재현 가능하게 통과하도록 만드는 것이다.

로컬 환경을 정상화한 뒤에는 다음 명령만으로 테스트가 통과해야 한다.

```bash
swift test
```

전체 Xcode를 설치한 뒤 개발자 디렉터리를 선택하는 일반적인 명령은 다음과
같다. 실제 Xcode 앱 이름과 경로에 맞게 수정해야 한다.

```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
swift test
```

## 우선 개선점

### P0 — 데이터 손실과 런타임 크래시

공개 API가 정상 입력 일부를 삭제하거나 프로세스를 종료할 수 있는 문제를 가장
먼저 해결한다.

- `assemble` 계열에서 숫자와 기호 등 비한글 문자가 사라지는 문제
- 큰 부동소수점 값이 지수 표기법으로 문자열화될 때 `numberToHangul`과
  `numberToHangulMixed`가 크래시하는 문제
- 소수점 이하의 `0`이 변환 결과에서 누락되는 문제
- NFD로 표현된 한글 `Character`를 완성형 한글로 잘못 판단해 크래시하는 문제

### P1 — 재현 가능한 테스트와 Swift 6 대응

- 지원하는 최소 Swift/Xcode 버전과 로컬 테스트 절차를 문서화한다.
- GitHub Actions에서 `swift build`와 `swift test`를 실행한다.
- 지원 대상별 CI 매트릭스를 정의하고 기본 명령만으로 테스트를 검증한다.
- Swift 6 언어 모드에서 오류가 되는 동시성 경고를 해결한다.
  - `JosaOption`과 이를 담은 정적 컬렉션의 `Sendable` 안전성
  - `curriedCombineCharacter` 정적 클로저의 `@Sendable` 안전성 또는 구조 개선

### P1 — es-hangul 2.4 동기화

검토 시점의 HangulKit 동작은 대체로 es-hangul 2.3.3 수준에 가깝지만 정확한
기준 커밋이 기록되어 있지 않다. 먼저 동기화 기준을 남긴 뒤 최신 변경 사항을
선별적으로 포팅한다.

- 기준 upstream 버전, 커밋, 동기화 날짜 기록
- `getJungseong`, `getJongseong` 추가
- 공개 `combineVowels` API 제공 여부 결정
- `getChoseong`의 `keepNonHangul` 옵션 지원
- 영문 대문자 약어에 대한 조사 처리 반영
- 조립 과정의 비한글 문자 보존과 소수점 이하 `0` 처리 반영
- 최신 발음 규칙과 예외 단어 수정 반영
- Swift에 맞게 의도적으로 다르게 설계한 API와 미지원 API 기록

### P1 — 공개 API 정리

1.0 이전에 호출 모호성과 오타를 정리하고, 이미 공개된 API는 가능한 한
점진적으로 마이그레이션한다.

- `DisassembledCharacter`의 프로퍼티와 생성자를 외부 모듈에서도 사용할 수
  있도록 공개
- 반환 타입만 다른 `disassemble` 및 `disassembleToGroups` 오버로드 제거
- `canBeJungsung`, `canbeJongseong` 오타 교정 및 deprecated 호환 API 제공
- 문자열 판별 API에서 “한글 포함 여부”와 “문자열 전체가 한글인지”의 의미 분리
- README에 소개된 `.hk.romanize()`를 구현하거나 해당 예시 제거

### P2 — 배포, 문서, 라이선스 정비

- `main`, Git 태그, GitHub Release가 서로 다른 이력을 가리키는 상태 정리
- README의 존재하지 않는 `1.0.0` 설치 버전 수정
- CHANGELOG와 upstream 동기화 기록 추가
- DocC의 템플릿 문구, 미완성 문장, 실제 API와 다른 예시 수정
- 포팅 원본인 es-hangul의 MIT 저작권 고지 보존 방식 검토
- 사용되지 않는 umbrella header와 파일명 공백 등 프로젝트 잔여물 정리

## 작업 백로그

아래 항목은 하나의 GitHub Issue로 분리할 수 있는 크기를 기준으로 작성했다.
상태는 `예정`, `진행 중`, `완료`, `보류` 중 하나로 갱신한다.

| ID | 우선순위 | 상태 | 작업 | 완료 조건 |
| --- | --- | --- | --- | --- |
| ENV-01 | P1 | 예정 | 지원 개발 환경 정의 | README 또는 기여 문서에 최소 Swift/Xcode 버전, 지원 플랫폼, `swift test` 절차가 명시되어 있다. |
| ENV-02 | P1 | 예정 | 로컬 Xcode 환경 정상화 및 기준 결과 기록 | 완전한 Xcode를 선택한 환경에서 별도 `-F`/`rpath` 플래그 없이 `swift test`가 통과하고 결과가 문서에 반영되어 있다. |
| CI-01 | P1 | 예정 | 기본 GitHub Actions 추가 | 깨끗한 체크아웃에서 `swift build`와 `swift test`가 자동 실행되고 모두 통과한다. |
| CI-02 | P1 | 예정 | Swift 6 언어 모드 검증 추가 | Swift 6 언어 모드 빌드가 CI에서 성공하며 동시성 안전성 진단이 오류로 남지 않는다. |
| COR-01 | P0 | 예정 | 조립 중 비한글 문자 보존 | `123`, `가!나`, `아이123` 같은 입력이 순서와 문자를 잃지 않으며 회귀 테스트가 추가되어 있다. |
| COR-02 | P0 | 예정 | 부동소수점 변환 안전성 개선 | 지수 표기, 유한값 경계, 소수점 이하 `0`을 안전하게 처리하고 `numberToHangul` 및 mixed 버전 테스트가 추가되어 있다. |
| COR-03 | P0 | 예정 | Unicode 정규화 및 scalar 검증 | NFC와 NFD 입력을 명시한 정책대로 처리하고 잘못된 scalar 입력에서도 크래시하지 않는다. |
| UP-01 | P1 | 예정 | upstream 기준점 기록 | `UPSTREAM.md` 등에 기준 버전·커밋·동기화 날짜·의도적 차이·미지원 기능이 기록되어 있다. |
| UP-02 | P1 | 예정 | es-hangul 2.4 변경 사항 포팅 | 채택하기로 한 2.3.4~2.4.0 기능과 수정 사항이 구현되고 upstream 사례 기반 회귀 테스트가 통과한다. |
| UP-03 | P1 | 예정 | upstream 차등 테스트 구축 | 대표 fixture를 두 구현에 적용해 결과 차이를 감지하며, 의도적 차이는 명시적으로 허용 목록에 기록한다. |
| API-01 | P1 | 예정 | 분해 API 오버로드 정리 | 반환 타입 문맥 없이도 호출이 모호하지 않으며 기존 사용자의 마이그레이션 경로가 문서화되어 있다. |
| API-02 | P1 | 예정 | 분해 결과 모델의 접근 수준 수정 | 외부 모듈에서 `DisassembledCharacter`의 필요한 필드를 읽고 의도한 방식으로 생성할 수 있다. |
| API-03 | P1 | 예정 | 오타 API 마이그레이션 | 올바른 이름이 제공되고 기존 이름은 제거 일정이 포함된 deprecation 메시지를 제공한다. |
| API-04 | P1 | 예정 | 문자열 판별 의미 정리 | 혼합 문자열에 대한 포함/전체 판별 API의 이름과 결과가 명확하며 테스트와 문서가 일치한다. |
| API-05 | P1 | 예정 | `.hk.romanize()` 불일치 해소 | wrapper가 실제로 구현되거나 README와 DocC에서 존재하지 않는 사용 예가 제거되어 있다. |
| DOC-01 | P2 | 예정 | README와 DocC 정비 | 설치 버전, wrapper 예제, 링크, 템플릿 문구가 현재 공개 API와 릴리스에 일치한다. |
| REL-01 | P2 | 예정 | 태그와 GitHub Release 이력 정리 | 새 릴리스 태그가 `main`의 의도한 커밋을 가리키고 GitHub Release 및 문서 버전과 일치한다. |
| REL-02 | P2 | 예정 | 변경 이력 도입 | 자체 변경과 upstream 반영 내용을 구분한 CHANGELOG가 제공되고 릴리스 절차에 갱신 단계가 포함되어 있다. |
| LEGAL-01 | P2 | 예정 | upstream 라이선스 고지 검토 | es-hangul에서 포팅한 코드에 필요한 원본 MIT 고지가 LICENSE 또는 NOTICE에 적절히 보존되어 있다. |
| CLEAN-01 | P2 | 예정 | 프로젝트 잔여물 정리 | `HangulKit.h`의 필요 여부가 결정되고 `transform9To11th .swift`의 파일명 공백이 제거되며 빌드와 테스트가 통과한다. |

## 세부 작업 지침

### COR-01: 비한글 문자 보존

현재 조립 과정에서 두 문자를 조합하지 못했을 때 빈 문자열을 대입하는 경로를
우선 확인한다. 실패는 입력 삭제가 아니라 두 문자를 원래 순서로 보존하는
방향으로 처리해야 한다.

필수 회귀 사례:

```swift
assemble(["1", "2", "3"])       // "123"
assemble(["아", "ㅇ", "ㅣ", "123"]) // "아이123"
assemble(["ㄱ", "ㅏ", "!", "ㄴ", "ㅏ"]) // "가!나"
```

완성 조건:

- 비한글 문자가 입력 위치에 그대로 남는다.
- 기존 한글 조립 테스트 결과가 바뀌지 않는다.
- String 입력과 `[Character]` 입력 양쪽을 검증한다.

### COR-02: 숫자 변환

부동소수점 값을 `String(describing:)`와 `.` 분리에만 의존해 처리하지 않는다.
지수 표기법, 음수, `NaN`, 무한대, 정밀도 및 지원 범위를 포함한 입력 정책을
먼저 정의한다.

필수 회귀 범주:

- 소수점 이하 중간 및 앞쪽의 `0` (`0.0102` 등)
- 지수 표기법으로 문자열화되는 큰 값과 작은 값
- `Float16`, `Float`, `Double`에서 지원하는 경계값
- `NaN`, 양의 무한대, 음의 무한대
- `numberToHangulMixed`의 동일 입력

### COR-03: Unicode 입력

Swift의 `Character`는 여러 Unicode scalar로 구성될 수 있으므로 첫 scalar만을
완성형 한글 코드 포인트라고 가정하지 않는다.

완성 조건:

- 입력을 NFC로 정규화할지, NFD를 별도 분해 입력으로 처리할지 정책이 문서화되어
  있다.
- 코드 포인트 산술 전에 단일 완성형 한글 scalar인지 검증한다.
- 잘못된 입력은 기존 API 계약에 맞춰 보존하거나 `nil`을 반환하며 크래시하지
  않는다.

### CI-01 및 CI-02: 검증 환경

첫 CI 도입 시에는 과도한 플랫폼 매트릭스보다 명확한 기준 환경 하나를 먼저
안정화한다. 이후 최소 지원 환경과 최신 지원 환경을 분리한다.

권장 검증 단계:

1. `swift --version`과 `xcodebuild -version` 출력
2. `swift build`
3. `swift test`
4. Swift 6 언어 모드 빌드
5. 필요하면 DocC 빌드

CI에서는 로컬 진단에 사용한 수동 `Testing.framework` 검색 경로를 사용하지
않는다. 정상적인 전체 Xcode 환경에서 기본 SwiftPM 동작을 검증하는 것이
목적이다.

### UP-01 및 UP-03: upstream 추적

동기화 문서에는 다음 정보를 유지한다.

- 마지막으로 비교한 es-hangul 버전과 Git 커밋
- 비교 날짜
- 그대로 포팅한 동작
- Swift API 관례에 맞게 변경한 동작
- 의도적으로 제외한 deprecated 또는 플랫폼 비호환 API
- 아직 반영하지 못한 upstream 변경

차등 테스트는 결과가 반드시 같아야 하는 사례와 Swift 포트에서 의도적으로
달라야 하는 사례를 분리한다. 이를 통해 새 upstream 릴리스가 나왔을 때 실제
회귀와 설계 차이를 구분할 수 있어야 한다.

## 권장 실행 순서

1. 완전한 Xcode 환경을 준비하고 기준 `swift test` 결과를 기록한다.
2. 최소 CI를 추가해 현재 동작을 고정한다.
3. COR-01~03의 데이터 손실 및 크래시를 회귀 테스트와 함께 수정한다.
4. Swift 6 동시성 진단을 해결하고 Swift 6 CI를 활성화한다.
5. upstream 기준점을 기록하고 es-hangul 2.4 변경 사항을 포팅한다.
6. 공개 API를 정리하고 deprecated 마이그레이션 경로를 제공한다.
7. 문서, 라이선스 고지, 태그 및 릴리스 이력을 정비한다.
8. 위 변경을 포함한 다음 마이너 릴리스를 준비한다.

## 전체 완료 기준

- 정상적인 지원 Xcode 환경에서 별도 우회 옵션 없이 `swift build`와
  `swift test`가 통과한다.
- 공개 API가 지원 입력에서 데이터를 조용히 삭제하거나 크래시하지 않는다.
- Swift 6 언어 모드에서 빌드가 성공한다.
- upstream 기준점과 의도적인 동작 차이가 문서화되어 있다.
- README, DocC, 실제 API, 최신 릴리스 정보가 서로 일치한다.
- 새 기능과 버그 수정에는 회귀 테스트가 포함된다.

