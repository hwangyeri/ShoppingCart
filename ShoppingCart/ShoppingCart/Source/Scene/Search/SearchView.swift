//
//  SearchView.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/08.
//

import UIKit
import SnapKit

final class SearchView: BaseView {
    
    let searchBar = {
       let view = UISearchBar()
        view.placeholder = "검색어를 입력해주세요"
        view.showsCancelButton = true
        return view
    }()
    
    let accuracyFilterButton = {
        let view = FilterButton()
        view.setTitle("정확도", for: .normal)
        return view
    }()
    
    let dateFilterButton = {
        let view = FilterButton()
        view.setTitle("날짜순", for: .normal)
        return view
    }()
    
    let hPriceFilterButton = {
        let view = FilterButton()
        view.setTitle("가격높은순", for: .normal)
        return view
    }()
    
    let lPriceFilterButton = {
        let view = FilterButton()
        view.setTitle("가격낮은순", for: .normal)
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier)
        return view
    }()
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        let size = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: size / 2, height: size / 1.35)
        return layout
    }
    
    let emptyView = {
        let view = EmptyView()
        return view
    }()
    
    override func configureView() {
        
        [searchBar, accuracyFilterButton, dateFilterButton, hPriceFilterButton, lPriceFilterButton, collectionView, emptyView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        accuracyFilterButton.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.equalTo(searchBar).inset(10)
            make.bottom.equalTo(collectionView.snp.top).offset(-10)
            make.width.equalTo(60)
            make.height.equalTo(32)
        }
        
        dateFilterButton.snp.makeConstraints { make in
            make.verticalEdges.size.equalTo(accuracyFilterButton)
            make.leading.equalTo(accuracyFilterButton.snp.trailing).offset(8)
        }
        
        hPriceFilterButton.snp.makeConstraints { make in
            make.verticalEdges.height.equalTo(accuracyFilterButton)
            make.leading.equalTo(dateFilterButton.snp.trailing).offset(8)
            make.width.equalTo(82)
        }
        
        lPriceFilterButton.snp.makeConstraints { make in
            make.verticalEdges.height.equalTo(accuracyFilterButton)
            make.leading.equalTo(hPriceFilterButton.snp.trailing).offset(8)
            make.width.equalTo(hPriceFilterButton)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
        emptyView.snp.makeConstraints { make in
            make.edges.equalTo(collectionView)
        }
        
    }
    
}
