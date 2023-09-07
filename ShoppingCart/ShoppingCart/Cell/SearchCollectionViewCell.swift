//
//  SearchCollectionViewCell.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = {
        let view = PhotoImageView(frame: .zero)
        return view
    }()
    
    let mallNameLabel = {
        let view = InfoLabel(
            text: "[mallName]",
            fontSize: 12,
            textColor: Constants.BaseColor.subText,
            numberOfLines: 1
        )
        return view
    }()
    
    let titleLabel = {
        let view = InfoLabel(
            text: "2층 캠핑카 자동차 캠핑 카라반 국내 여행 발리 보라카이 유니버셜 일본여행이이이이이아에이오우",
            fontSize: 13,
            textColor: Constants.BaseColor.text,
            numberOfLines: 2
        )
        return view
    }()
    
    let lPriceLabel = {
        let view = InfoLabel(
            text: "26,500,600,008,990",
            fontSize: 16,
            textColor: Constants.BaseColor.text,
            numberOfLines: 1
        )
        return view
    }()
    
    let likeButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "heart"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    let likeBackgroundImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 35 / 2
        view.backgroundColor = .white
        return view
    }()
    
    override func configure() {
        
        [imageView, mallNameLabel, titleLabel, lPriceLabel, likeBackgroundImageView, likeButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView)
            make.height.equalTo(contentView).multipliedBy(0.68)
        }
        
        mallNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(2)
            make.horizontalEdges.equalToSuperview().inset(5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mallNameLabel.snp.bottom).offset(2)
            make.horizontalEdges.equalTo(mallNameLabel)
        }
        
        lPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.horizontalEdges.equalTo(mallNameLabel)
        }
        
        likeButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView).inset(10)
            make.size.equalTo(35)
        }
        
        likeBackgroundImageView.snp.makeConstraints { make in
            make.center.equalTo(likeButton)
            make.size.equalTo(likeButton)
        }
        
    }
    
}
