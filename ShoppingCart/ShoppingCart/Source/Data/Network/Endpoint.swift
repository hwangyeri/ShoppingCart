//
//  Endpoint.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/08.
//

import Foundation

enum Endpoint {
    
    enum SortType: String {
        case sim // 정확도순으로 내림차순 정렬
        case date // 날짜순으로 내림차순 정렬
        case asc // 가격순으로 오름차순 정렬
        case dsc // 가격순으로 내림차순 정렬
    }
    
    case shopping(type: SortType, query: String, page: Int, start: Int)
    
    var requestURL: String {
        switch self {
        case .shopping(let type, let query, let page, let start):
            return URL.makeEndPointString("&query=\(query)&page=\(page)&start=\(start)&display=30&sort=\(type.rawValue)")
        }
    }
    
}

