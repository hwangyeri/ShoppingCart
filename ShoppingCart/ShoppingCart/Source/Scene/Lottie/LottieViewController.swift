//
//  LottieViewController.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import UIKit
import Lottie

final class LottieViewController: BaseViewController {
    
    private let animationView: LottieAnimationView = {
      let view = LottieAnimationView(name: "ShoppingCartAnimation")
      return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        
        view.addSubview(animationView)
        
        animationView.frame = view.bounds
        animationView.center = view.center
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.play()

        self.view.backgroundColor = .white
    }
    
}

