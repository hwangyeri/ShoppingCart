//
//  ReusableViewProtocol.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import UIKit

// 객체를 문자열로 표현하는 방법: String(describing:) -> NSObject description()
// 접근 제어자: public -> internal

protocol ReusableViewProtocol: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableViewProtocol where Self: NSObject { // where Self: protocol의 extension에서 특정 타입에서만 확장하고자 할 때 사용, 유형 제약조건
    static var reuseIdentifier: String {
        return self.description()
    }
}

extension UIViewController: ReusableViewProtocol { }

extension UICollectionViewCell: ReusableViewProtocol { }
