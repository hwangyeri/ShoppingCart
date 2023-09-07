//
//  BaseCollectionViewCell.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.backgroundColor = Constants.BaseColor.background
    }
    
    func setConstraints() {
        
    }
}
