//
//  SearchViewController.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import UIKit
import SnapKit
import Kingfisher

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    
    var page = 1
    var start = 1
    var isLoading = false
    
    var currentFilterType: Endpoint.SortType = .sim
    var selectedFilterButton: UIButton?
        
    private var searchList: Shopping = Shopping(total: 0, start: 0, display: 0, items: [])
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarCancelButtonAttributes()
    }
    
    override func configure() {
        mainView.searchBar.becomeFirstResponder()
        mainView.searchBar.delegate = self
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.prefetchDataSource = self
        
        mainView.accuracyFilterButton.addTarget(self, action: #selector(accuracyFilterButtonTapped), for: .touchUpInside)
        mainView.dateFilterButton.addTarget(self, action: #selector(dateFilterButtonTapped), for: .touchUpInside)
        mainView.hPriceFilterButton.addTarget(self, action: #selector(hPriceFilterButtonTapped), for: .touchUpInside)
        mainView.lPriceFilterButton.addTarget(self, action: #selector(lPriceFilterButtonTapped), for: .touchUpInside)
        
        selectFilterButton(mainView.accuracyFilterButton) // 초기 필터 상태를 정확도로 설정
    }
    
    //Custom CancelButton
    func searchBarCancelButtonAttributes() {
        let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: Constants.BaseColor.text]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes , for: .normal)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "취소"
    }
    
    //Call API
    private func callSearchAPI(_ filterType: Endpoint.SortType) {
        print(#function)
        
        page = 1
        searchList.items.removeAll()
        
        guard let query = mainView.searchBar.text else {
            print("검색어 오류 query issue")
            return
        }
        
        APIService.shared.searchShopping(type: filterType, query: query, page: page, start: start) { data in
            guard let data = data else {
                // FIXME: 검색 결과가 없을때 처리 필요 -> 검색 결과가 없음 Alert, EmptyView 보여주기
                return
            }
            
            self.searchList = data
            print("------ 데이터 -------", data)
            //print("------ 서치리스트 -------", self.searchList)
            
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
                
                // 새로 검색했을때 맨 상단 화면 보여주기 위해서 맨 위로 스크롤
                if self.searchList.items.count > 0 {
                    let indexPath = IndexPath(item: 0, section: 0)
                    self.mainView.collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
                }
                
            }
        }
    }
    
    //MARK: - FilterButton
    @objc func accuracyFilterButtonTapped() {
        callSearchAPI(.sim)
        currentFilterType = .sim
        selectFilterButton(mainView.accuracyFilterButton)
    }

    @objc func dateFilterButtonTapped() {
        callSearchAPI(.date)
        currentFilterType = .date
        selectFilterButton(mainView.dateFilterButton)
    }

    @objc func hPriceFilterButtonTapped() {
        callSearchAPI(.dsc)
        currentFilterType = .dsc
        selectFilterButton(mainView.hPriceFilterButton)
    }

    @objc func lPriceFilterButtonTapped() {
        callSearchAPI(.asc)
        currentFilterType = .asc
        selectFilterButton(mainView.lPriceFilterButton)
    }

    
    func selectFilterButton(_ button: UIButton) {
        // 선택된 필터 버튼 컬러 변경
        button.backgroundColor = Constants.FilterButtonColor.selectedBackground
        button.setTitleColor(Constants.FilterButtonColor.selectedText, for: .normal)
        
        // 이전에 선택된 필터 버튼 컬러 초기화
        if let previousSelectedButton = selectedFilterButton, previousSelectedButton != button { // 취소 버튼을 눌렀을 때, 디폴트 필터가 선택된 상태로 유지
            previousSelectedButton.backgroundColor = Constants.FilterButtonColor.defaultBackground
            previousSelectedButton.setTitleColor(Constants.FilterButtonColor.defaultText, for: .normal)
        }
        
        selectedFilterButton = button
    }
    
}

//MARK: - CollectionView
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchList.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        let data = searchList.items[indexPath.row]
        
//        cell.backgroundColor = .systemYellow
//        cell.imageView.backgroundColor = .systemRed
        
        cell.mallNameLabel.text = "[\(data.mallName)]"
        cell.titleLabel.text = data.title
        cell.lPriceLabel.text = data.lprice //FIXME: NumberFormatter
        
        guard let url = URL(string: data.image) else {
            showAlertMessage(title: "이미지 로드 실패") {
                cell.imageView.image = UIImage(systemName: "nosign")
            }
            return cell
        }
        
        cell.imageView.kf.setImage(with: url)
        
        return cell
    }
    
}

// MARK: - SearchBar
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        
        // 선택한 필터 타입으로 검색을 진행
        callSearchAPI(currentFilterType)
        
        searchBar.resignFirstResponder() // keyboard dismiss
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        searchList.items.removeAll()
        print("---- searchList 데이터 삭제되었는지 확인 ------", searchList.items)
        
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
        
        searchBar.text = ""
        searchBar.resignFirstResponder()
        selectFilterButton(mainView.accuracyFilterButton) // 취소버튼 클릭시 정확도 버튼을 디폴트로 설정
    }
    
}

//MARK: - Pagination
extension SearchViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if indexPath.row >= searchList.items.count - 1 && !isLoading {
                
                guard !isLoading else { return }
                isLoading = true
                
                // 검색 시작 위치를 수정해서 중복 데이터 호출 방지
                let nextPageStart = page * searchList.display + 1
                
                page += 1
                print("------- 페이지 -----", page)
                
                guard let query = mainView.searchBar.text else {
                    print("query issue")
                    return
                }
                
                APIService.shared.searchShopping(type: currentFilterType, query: query, page: page, start: nextPageStart) { data in
                    guard let data = data else { return }
                    
                    // 중복 데이터 필터링 및 추가
                    let newItems = data.items.filter { newItem in
                        // 이미 있는 데이터와 중복되지 않은 경우만 필터링
                        return !self.searchList.items.contains { existingItem in
                            return newItem.productID == existingItem.productID
                        }
                    }
                    self.searchList.items.append(contentsOf: newItems)
                    
                    print("------- 시작 -----", nextPageStart)
                    //print("------ 서치리스트 -------", self.searchList)
                    print("------ 서치리스트 아이템 수 -------", self.searchList.items.count)
                    
                    DispatchQueue.main.async {
                        self.mainView.collectionView.reloadData()
                        self.isLoading = false
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        print("------- 취소: \(indexPaths) -----")
    }
    
}

