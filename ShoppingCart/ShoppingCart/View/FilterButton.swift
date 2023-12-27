//
//  FilterButton.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import UIKit

final class FilterButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Constants.BaseColor.background
        layer.borderColor = Constants.BaseColor.border
        layer.cornerRadius = 17
        layer.borderWidth = Constants.Desgin.borderWidth
        titleLabel?.font = .customFont(.medium, size: 14)
        setTitleColor(Constants.BaseColor.text, for: .normal)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

