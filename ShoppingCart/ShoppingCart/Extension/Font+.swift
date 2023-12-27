//
//  Font+.swift
//  ShoppingCart
//
//  Created by Yeri Hwang on 2023/12/27.
//

import UIKit

extension UIFont {
    
    enum CustomFontWeight: String {
        case black = "Black"
        case bold = "Bold"
        case light = "Light"
        case medium = "Medium"
        case regular = "Regular"
        case semiBold = "SemiBold"
        case thin = "Thin"
    }
    
    static func customFont(_ weight: CustomFontWeight, size: CGFloat) -> UIFont? {
        let fontName = "Pretendard-\(weight.rawValue)"
        return UIFont(name: fontName, size: size)
    }
    
}


