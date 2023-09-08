//
//  Color.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import UIKit

extension Constants {
    
    enum BaseColor {
        static let background = UIColor.systemBackground
        static let border = UIColor.systemGray.cgColor
        static let text = UIColor.label
//        static let placeholder = UIColor.systemGray
        static let subText = UIColor.systemGray // FIXME: 색 바꾸기
        static let point = UIColor.systemRed
    }
    
    enum FilterButtonColor {
        static let defaultBackground = UIColor.systemBackground
        static let defaultText = UIColor.label
        static let selectedBackground = UIColor.label
        static let selectedText = UIColor.systemBackground
    }
    
}

