//
//  LikeViewController.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/09.
//

import UIKit
import RealmSwift

/*
 
 추가 예정
 - 좋아요 목록 리스트로 보여주는 기능 (네비 바 왼쪽)
 - 좋아요 된 아이템 전체 삭제 기능 (네비 바 오른쪽)
 
 */

class LikeViewController: BaseViewController {
    
    let mainView = LikeView()
    let repository = ShoppingTableRepository()
    
    private var likeList: Results<ShoppingTable>!
    private var shoppingItems: Item = Item(title: "", image: "", lprice: "", mallName: "", productID: "") // API에서 받은 데이터를 저장할 배열
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataDidChange), name: NSNotification.Name("DataDidChange"), object: nil)
        
        likeList = repository.fetch()
    }
    
    override func configure() {
        mainView.searchBar.becomeFirstResponder()
        mainView.searchBar.delegate = self
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
    
    // NSNotification 수신할 때 실행할 함수
    @objc func dataDidChange() {
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
    }

}

// MARK: - CollectionView

extension LikeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReusableCollectionViewCell.reuseIdentifier, for: indexPath) as? ReusableCollectionViewCell else { return UICollectionViewCell() }
        let data = likeList[indexPath.row]
        
        cell.mallNameLabel.text = "[\(data.mallName)]"
        cell.titleLabel.text = data.title.removeHTMLTags()
        cell.lPriceLabel.text = data.price.formatNumber()
        cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        if let url = URL(string: data.photo) {
            cell.imageView.kf.setImage(with: url)
        } else {
            showAlertMessage(title: "이미지 로드 실패: 유효하지 않은 이미지입니다.") {
                cell.imageView.image = UIImage(systemName: "nosign")
            }
        }
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        print("Mall Name: \(cell.mallNameLabel.text ?? "N/A")")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedLikeItem = likeList[indexPath.row] // 선택된 아이템 데이터 가져오기
        shoppingItems = Item(title: selectedLikeItem.title, image: selectedLikeItem.photo, lprice: selectedLikeItem.price, mallName: selectedLikeItem.mallName, productID: selectedLikeItem.productID)
        
        let vc = DetailViewController()
        vc.likeSelectedItem = shoppingItems
        vc.isFromLikeView = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - >>>>> 좋아요 버튼 클릭 !!!! <<<<<<
    
    @objc func likeButtonTapped(sender: UIButton) {
        print("----- 라이크뷰 좋아요 버튼 -----")
        
        let rowIndex = sender.tag
        guard rowIndex >= 0 && rowIndex < likeList.count else {
            return
        }
        print("\\\\\\ 인덱스 \\\\\\", rowIndex)
        
        let item = likeList[rowIndex]
        print("-------- 아이템 -----", item)
        
        if let cell = mainView.collectionView.cellForItem(at: IndexPath(item: rowIndex, section: 0)) as? ReusableCollectionViewCell {
            repository.deleteItem(item)
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("DataDidChange"), object: nil)
    }
    
}

// MARK: - SearchBar

extension LikeViewController: UISearchBarDelegate {
    
    // 데이터 베이스에 저장된 데이터 -> 실시간 검색 기능
    // 검색 쿼리는 title 로 제한
    // 아무것도 검색하지 않은 경우에는 저장된 전채 상품 출력
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            // 검색어가 비어있을 때는 모든 데이터를 표시
            likeList = repository.fetch()
        } else {
            // 검색어가 비어있지 않을 때는 검색어를 포함하는 데이터만 필터링
            likeList = repository.searchItems(forTitle: searchText)
        }
        
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        likeList = repository.fetch()
        searchBar.text = ""
        
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
    }

    
}
