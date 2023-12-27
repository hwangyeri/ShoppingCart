//
//  DetailViewController.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/11.
//

import UIKit
import WebKit
import RealmSwift

class DetailViewController: BaseViewController {
    
    let mainView = DetailView()
    var webView = WKWebView()
    let repository = ShoppingTableRepository()
    var likeButton = UIButton()
    
    var searchSelectedItem: Item = Item(title: "", image: "", lprice: "", mallName: "", productID: "")
    var likeSelectedItem: Item = Item(title: "", image: "", lprice: "", mallName: "", productID: "")
    
    var isFromLikeView: Bool = false
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 좋아요 버튼 설정
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: likeButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isFromLikeView {
            // 라이크 뷰에서 열린 경우
            configureDetailView(with: likeSelectedItem)
        } else {
            // 서치 뷰에서 열린 경우
            configureDetailView(with: searchSelectedItem)
        }
    }
    
    override func configure() {
        super.configure()
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = Constants.BaseColor.background
        navigationController?.navigationBar.scrollEdgeAppearance = navigationAppearance
        navigationController?.navigationBar.standardAppearance = navigationAppearance
        navigationController?.navigationBar.tintColor = Constants.BaseColor.text
    }
    
    // 디테일 뷰 설정
    func configureDetailView(with selectedItem: Item) {
        
        DispatchQueue.main.async {
            self.title = selectedItem.title.removeHTMLTags()
        }
        
        if let myURL = URL(string: "https://msearch.shopping.naver.com/product/\(selectedItem.productID)") {
            let myRequest = URLRequest(url: myURL)
            mainView.webView.load(myRequest)
        } else {
            showAlertMessage(message: "상품의 URL에 문제가 있습니다.\n다시 시도해주세요. 😭")
            print("URL 생성 실패")
        }
        
        let duplicateItems = repository.duplicateFilterItems(forProductID: selectedItem.productID)

        if duplicateItems.isEmpty {
            DispatchQueue.main.async {
                self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        } else {
            DispatchQueue.main.async {
                self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                self.likeButton.tintColor = UIColor(named: "myGreen")
            }
        }
        
    }
    
    // MARK: - >>>> 좋아요 버튼 클릭!!! <<<<<
    
    @objc func likeButtonTapped() {
        print(#function)
        
        let selectedItem = isFromLikeView ? likeSelectedItem : searchSelectedItem
        let duplicateItems = repository.duplicateFilterItems(forProductID: selectedItem.productID)
        
        if duplicateItems.isEmpty {
            let newItem = ShoppingTable(productID: selectedItem.productID, photo: selectedItem.image, mallName: selectedItem.mallName, title: selectedItem.title, price: selectedItem.lprice, likeDate: Date())
            repository.createItem(newItem)
            print("새로운 아이템 저장: \(newItem)")
            DispatchQueue.main.async {
                self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                self.likeButton.tintColor = UIColor(named: "myGreen")
            }
        } else {
            if let duplicatedItem = duplicateItems.first {
                repository.deleteItem(duplicatedItem)
                print("중복 아이템 삭제: \(duplicatedItem)")
                DispatchQueue.main.async {
                    self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
                }
            }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("DataDidChange"), object: nil)
    }
    
    
}
