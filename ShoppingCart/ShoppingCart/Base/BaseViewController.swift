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
        hideKeyboardWhenTappedBackground()
        view.backgroundColor = Constants.BaseColor.background
    }
    
    func configure() { }
    
    func setConstraints() { }
    
    func showAlertMessage(title: String, button: String = "확인", handler: (() -> ())? = nil ) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: button, style: .default) { _ in
            handler?()
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}

// MARK: - Hide Keyboard

extension UIViewController {

    func hideKeyboardWhenTappedBackground() {
         let tapEvent = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
         tapEvent.cancelsTouchesInView = false
         view.addGestureRecognizer(tapEvent)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


