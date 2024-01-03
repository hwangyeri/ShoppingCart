//
//  InfoLabel.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/08.
//

import UIKit

final class InfoLabel: UILabel {
    
    init(fontWeight: UIFont.CustomFontWeight, fontSize: CGFloat, textColor: UIColor, numberOfLines: Int) {
        super.init(frame: .zero)
        self.font = .customFont(fontWeight, size: fontSize)
        self.textColor = textColor
        self.numberOfLines = numberOfLines
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
