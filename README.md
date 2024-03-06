# 🛒 ShoppingCart
<img width="70" alt="스크린샷 2024-03-07 오전 1 38 01" src="https://github.com/hwangyeri/ShoppingCart/assets/114602459/abf0e17b-c3e8-4a71-804b-3ee7d20b561a">

### 위시템을 담아 나만의 장바구니를 만들 수 있는 앱입니다.

![shoppingcartMockup 001](https://github.com/hwangyeri/ShoppingCart/assets/114602459/8d469f1a-98c5-4a25-982f-8b07338ae87d)

## 주요 기능
- 상품 검색 • 좋아요 • 상세페이지 조회 기능
- 상품 이미지 • 쇼핑몰 • 가격 정보 확인 및 필터 기능
- 좋아요 목록 관리 • 실시간 검색 기능
<br/>

## 개발 환경
- **최소 버전** : iOS 16.0
- **개발 인원** : 1명
- **개발 기간** : 2023.09.07 ~ 2023.9.16 (1주)
- **기타** : Dark Mode 지원
<br/>

## 기술 스택
- `UIKit`, `CodeBaseUI`, `SPM`
- `MVC`, `Singleton`, `Repository Pattern`
- `Autolayout`, `CompositionalLayout`
- `Snapkit`, `Kingfisher`, `URLSession`
- `Realm`, `Webkit`, `Lottie`
<br/>

## 핵심 기술
- 네이버 Open API를 이용한 쇼핑 검색, `Offset-based Pagination` 구현
- `Realm` Local DB를 이용한 좋아요 목록 관리 • 실시간 검색 기능
- `URLSession`과 `Enum`을 이용한 REST API 통신 캡슐화
- `Kingfisher`를 이용한 이미지 로드 및 최적화
- `NotificationCenter`를 이용한 좋아요 상태 동기화 처리
- `Lottie`를 이용한 Animation LaunchScreen 구현
<br/>

## 문제 해결
### 1. API 통신으로 수신한 이미지 원본을 Cell에 할당한 경우, 런타임 에러 발생
- 문제 상황 : 네이버 쇼핑 API를 통해 가져온 원본 이미지를 이미지 뷰에 표기한 경우, 메모리 오버헤드로 인해 이미지가 제대로 로드되지 않거나 런타임 에러가 발생함.
- 해결 방법 : Kingfisher를 이용해 이미지를 효과적으로 로드하고, 메모리 사용을 최적화함.


```swift
extension UIImageView {
    
    func setImage(withURL imageUrl: String) {
        
        // 캐싱 목적으로 원본 이미지 디스크에 저장
        var options: KingfisherOptionsInfo = [
            .cacheOriginalImage
        ]
        
        // 메모리 사용량을 줄이기 위해서 이미지 다운샘플링 처리
        options.append(.processor(DownsamplingImageProcessor(size: CGSize(width: 100, height: 100))))
        
        // 이미지 품질을 향상 시키기 위해서 기기 화면에 맞는 배율 지정
        options.append(.scaleFactor(UIScreen.main.scale))
        
        self.kf.setImage(
            with: URL(string: imageUrl),
            placeholder: UIImage(named: "shoppingCart"),
            options: options
        )
    }
    
}
```


### 2. Cell 재사용시 깜빡이거나 데이터가 뒤섞이는 현상 발생
- 문제 상황 : TableView에서 셀이 재사용 될 때, 이전의 데이터와 새로운 데이터가 뒤섞이거나 UI가 깜빡거리는 현상이 발생함.
- 해결 방법 : prepareForReuse 메서드를 이용해 재사용 되는 셀의 상태를 초기화해서 문제를 해결하고, 메모리 누수를 방지함.


```swift
final class SearchCollectionViewCell: BaseCollectionViewCell {

 override func prepareForReuse() {
        imgView.image = .none
        mallNameLabel.text = ""
        titleLabel.text = ""
        lPriceLabel.text = ""
    }
}
```

<br/>

## UI / UX
|<img src="https://github.com/hwangyeri/ShoppingCart/assets/114602459/473e59e5-fff4-4984-8b55-d6e182d17d74.gif" width=250></img>|<img src="https://github.com/hwangyeri/ShoppingCart/assets/114602459/88a191be-5494-4dd6-b8ef-5954f571166a.gif" width=250></img>|
|:-:|:-:|
|`상품 검색/필터 기능`|`좋아요 기능, 다크모드`|
<br/>

## Commit Convention
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
