//
//  DetailView.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/11.
//

import UIKit
import SnapKit
import WebKit

final class DetailView: BaseView {
    
    var webView = WKWebView()
    
    override func configureView() {
        addSubview(webView)
    }
    
    override func setConstraints() {
        
        webView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
