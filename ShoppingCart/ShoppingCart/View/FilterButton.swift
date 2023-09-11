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
        layer.cornerRadius = Constants.Desgin.cornerRadius
        layer.borderWidth = Constants.Desgin.borderWidth
        titleLabel?.font = .systemFont(ofSize: 14)
        setTitleColor(Constants.BaseColor.text, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

