//
//  BaseViewController.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setConstraints()
        view.backgroundColor = Constants.BaseColor.background
    }
    
    func configure() {
        
    }
    
    func setConstraints() {}
    
    func showAlertMessage(title: String, button: String = "확인", handler: (() -> ())? = nil ) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: button, style: .default) { _ in
            handler?()
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}

