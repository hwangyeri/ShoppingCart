//
//  Alert+Extension.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/23.
//

import UIKit

extension UIViewController {
    
    //MARK: - Alert
    func showAlertMessage(message: String, button: String = "확인", handler: (() -> ())? = nil ) {
        let alert = UIAlertController(title: "잠시만요..!", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: button, style: .default) { _ in
            handler?()
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}
