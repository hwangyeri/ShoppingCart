//
//  InfoLabel.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/08.
//

import UIKit

final class InfoLabel: UILabel {
    
    init(text: String, fontSize: CGFloat, textColor: UIColor, numberOfLines: Int) {
        super.init(frame: .zero)
        self.text = text
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = textColor
        self.numberOfLines = numberOfLines
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
