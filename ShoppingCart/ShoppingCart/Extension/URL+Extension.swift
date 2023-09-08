//
//  URL+Extension.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/08.
//

import Foundation

extension URL {
    static let baseURL = "https://openapi.naver.com/v1/search/shop.json?"
    
    static func makeEndPointString(_ endpoint: String) -> String {
        return baseURL + endpoint
    }
}
