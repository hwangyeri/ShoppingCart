//
//  String+Extension.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/11.
//

import Foundation

extension String {
    
    //MARK: - Number Formatter
    func formatNumber() -> String {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            if let formattedPrice = numberFormatter.string(from: NSNumber(value: Double(self) ?? 0)) {
                return formattedPrice
            }
            return ""
        }
    
    //MARK: - HTML tags Remove
    func removeHTMLTags() -> String {
        let regex = try? NSRegularExpression(pattern: "<[^>]+>", options: .caseInsensitive)
        let range = NSRange(location: 0, length: self.utf16.count)
        return regex?.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "") ?? self
    }
    
    
}


