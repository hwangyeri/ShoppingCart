//
//  PhotoImageView.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import UIKit

final class PhotoImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentMode = .scaleAspectFit
        clipsToBounds = true
        layer.cornerRadius = Constants.Desgin.cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
