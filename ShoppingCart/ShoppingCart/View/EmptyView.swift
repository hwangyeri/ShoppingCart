//
//  EmptyView.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/16.
//

import UIKit
import SnapKit

final class EmptyView: UIView {
    
    let mainLabel = {
        let view = UILabel()
        view.text = "아직 검색 결과가 없습니다."
        view.font = .customFont(.semiBold, size: 15)
        view.textColor = Constants.BaseColor.text
        return view
    }()
    
    let subLabel = {
        let view = UILabel()
        view.text = "원하는 상품을 검색하고 저장해보세요!"
        view.font = .customFont(.regular, size: 13)
        view.textColor = Constants.BaseColor.text
        return view
    }()
    
    let imageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "doc.text.magnifyingglass")
        view.tintColor = Constants.BaseColor.text
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        
        [imageView, mainLabel, subLabel].forEach {
            addSubview($0)
        }
    }
    
    func setConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(170)
            make.size.equalTo(50)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(20)
        }
        
        subLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
        }
    }
    
}

