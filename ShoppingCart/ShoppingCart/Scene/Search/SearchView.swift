//
//  SearchView.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/08.
//

import UIKit
import SnapKit

class SearchView: BaseView {
    
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
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(ReusableCollectionViewCell.self, forCellWithReuseIdentifier: ReusableCollectionViewCell.reuseIdentifier)
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        let size = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: size / 2, height: size / 1.35)
        return layout
    }
    
    override func configureView() {
        
        [searchBar, accuracyFilterButton, dateFilterButton, hPriceFilterButton, lPriceFilterButton, collectionView].forEach {
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
            make.width.equalTo(45)
            make.height.equalTo(30)
        }
        
        dateFilterButton.snp.makeConstraints { make in
            make.verticalEdges.size.equalTo(accuracyFilterButton)
            make.leading.equalTo(accuracyFilterButton.snp.trailing).offset(8)
        }
        
        hPriceFilterButton.snp.makeConstraints { make in
            make.verticalEdges.height.equalTo(accuracyFilterButton)
            make.leading.equalTo(dateFilterButton.snp.trailing).offset(8)
            make.width.equalTo(70)
        }
        
        lPriceFilterButton.snp.makeConstraints { make in
            make.verticalEdges.height.equalTo(accuracyFilterButton)
            make.leading.equalTo(hPriceFilterButton.snp.trailing).offset(8)
            make.width.equalTo(hPriceFilterButton)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
    }
    
}
