//
//  ShoppingTable.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/09.
//

import Foundation
import RealmSwift

class ShoppingTable: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var productID: String // 네이버 쇼핑의 상품 ID
    @Persisted var photo: String // 섬네일 이미지의 URL
    @Persisted var mallName: String // 상품을 판매하는 쇼핑몰 이름
    @Persisted var title: String // 상품 이름
    @Persisted var price: String // 최저가
    @Persisted var likeDate: Date // 좋아요 목록에 등록한 날짜
    
    convenience init(productID: String, photo: String, mallName: String, title: String, price: String, likeDate: Date) {
        self.init()
        
        self.productID = productID
        self.photo = photo
        self.mallName = mallName
        self.title = title
        self.price = price
        self.likeDate = likeDate
        
    }
    
}
