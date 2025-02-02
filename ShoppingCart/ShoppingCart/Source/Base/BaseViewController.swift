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
    
}


extension UIViewController {

    //MARK: - Hide Keyboard
    func hideKeyboardWhenTappedBackground() {
         let tapEvent = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
         tapEvent.cancelsTouchesInView = false
         view.addGestureRecognizer(tapEvent)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


