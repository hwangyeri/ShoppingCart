//
//  LikeView.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/09.
//

import UIKit
import SnapKit

final class LikeView: BaseView {
    
    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "검색어를 입력해주세요"
        view.showsCancelButton = true
        return view
    }()
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(LikeCollectionViewCell.self, forCellWithReuseIdentifier: LikeCollectionViewCell.reuseIdentifier)
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        let widthSize = UIScreen.main.bounds.width
        let heightSize = UIScreen.main.bounds.height / 5.5
        layout.itemSize = CGSize(width: widthSize, height: heightSize)
        return layout
    }
    
    override func configureView() {
        
        [searchBar, collectionView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(collectionView.snp.top)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
    }
    
}
