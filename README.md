# 🛒 ShoppingCart

![shoppingcartMockup 001](https://github.com/hwangyeri/ShoppingCart/assets/114602459/d9ce6aa2-ae38-4dfa-becd-c2a46d277178)

### 위시템을 담아 나만의 장바구니를 만들 수 있는 앱입니다.
- 네이버 쇼핑 API를 활용해 상품 검색 기능 제공
- `RealmSwift`을 활용해 상품 좋아요 기능 제공
- 좋아요 목록 관리, 실시간 검색 기능 제공
- `WKWebView`을 활용해 상품 상세페이지 조회 기능 제공
<br/>

### 1. 개발 환경
- Deployment Target iOS 13.0
- Only Portrait
- Dark mode 지원
<br/>

### 2. 개인 프로젝트
- **개발 기간** : 2023.09.07 ~ 2023.9.16 (1주)
- **개발 인원** : 1명
<br/>

## 3. 기술 스택
- `UIKit`, `CodeBaseUI`
- `Autolayout`, `CompositionalLayout`, `DarkMode`
- `MVC`, `Singleton`, `Repository`, `GCD`, `URLSession`
- `Kingfisher`, `Snapkit`, `RealmSwift`, `RealmCocoa`, `Lottie`
<br/>

### 3.1 라이브러리
 
| 이름 | 버전 | 의존성 관리 |
| ------------- | :-------: | :---: |
| Kingfisher   | `7.0.0`   | `SPM` |
| Realm        | `10.42.1` | `SPM` |
| SnapKit      | `5.0.0`   | `SPM` |
| Lottie       | `4.3.4`   | `SPM` |
<br/>

## 4. 핵심 기능
- 네이버 Open API를 활용해 쇼핑 검색, Cursor-based `Pagination` 기능 구현
- `Realm` Local DB를 활용해 좋아요 목록 관리, 실시간 검색 기능 구현
- `URLSession`과 `Enum`을 사용해 네트워크 통신 기능 구현
- `NotificationCenter`을 활용해 좋아요 상태 동기화 처리
- `Kingfisher`를 활용해 이미지 캐싱 및 다운샘플링 기능 구현
- `Lottie`를 활용해 Animation LaunchScreen 구현
<br/>

## 5. Trouble Shooting
<br/>

## 6. UI/UX
- gif 파일 업데이트 예정
<br/>

## 7. Commit Convention
```
- [Feat] 새로운 기능 구현
- [Style] UI 디자인 변경
- [Fix] 버그, 오류 해결
- [Refactor] 코드 리팩토링
- [Remove] 쓸모 없는 코드 삭제
- [Rename] 파일 이름/위치 변경
- [Chore] 빌드 업무, 패키지 매니저 및 내부 파일 수정
- [Comment] 필요한 주석 추가 및 변경
- [Test] 테스트 코드, 테스트 코드 리펙토링
```
<br/>

