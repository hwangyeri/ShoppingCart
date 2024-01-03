//
//  Shopping.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import Foundation

//MARK: - Shopping
struct Shopping: Codable {
    let total, start, display: Int // 총 검색 결과 개수, 검색 시작 위치, 한 번에 표시할 검색 결과 개수
    var items: [Item]
}

//MARK: - Item
struct Item: Codable {
    let title: String // 상품 이름
    let image: String // 섬네일 이미지의 URL
    let lprice, mallName: String // 최저가, 상품을 판매하는 쇼핑몰 이름
    let productID: String // 네이버 쇼핑의 상품 ID

    enum CodingKeys: String, CodingKey {
        case title, image, lprice, mallName
        case productID = "productId"
    }
}

