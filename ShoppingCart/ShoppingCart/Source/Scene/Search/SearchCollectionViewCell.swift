//
//  SearchCollectionViewCell.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/07.
//

import UIKit
import SnapKit

final class SearchCollectionViewCell: BaseCollectionViewCell {
    
    let imgView = {
        let view = PhotoImageView(frame: .zero)
        return view
    }()
    
    let mallNameLabel = {
        let view = InfoLabel(
            fontWeight: .medium, fontSize: 14,
            textColor: Constants.BaseColor.text,
            numberOfLines: 1
        )
        return view
    }()
    
    let titleLabel = {
        let view = InfoLabel(
            fontWeight: .regular, fontSize: 13,
            textColor: Constants.BaseColor.text,
            numberOfLines: 2
        )
        return view
    }()
    
    let lPriceLabel = {
        let view = InfoLabel(
            fontWeight: .semiBold, fontSize: 16,
            textColor: Constants.BaseColor.text,
            numberOfLines: 1
        )
        view.font = .boldSystemFont(ofSize: 16)
        return view
    }()
    
    let likeButton = {
        let view = UIButton()
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
        [imgView, mallNameLabel, titleLabel, lPriceLabel, likeBackgroundImageView, likeButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        imgView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        mallNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mallNameLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(mallNameLabel)
        }
        
        lPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(mallNameLabel)
            make.bottom.equalToSuperview().inset(20)
        }
        
        likeButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imgView).inset(10)
            make.size.equalTo(35)
        }
        
        likeBackgroundImageView.snp.makeConstraints { make in
            make.center.equalTo(likeButton)
            make.size.equalTo(likeButton)
        }
        
    }
    
    override func prepareForReuse() {
        imgView.image = .none
        mallNameLabel.text = ""
        titleLabel.text = ""
        lPriceLabel.text = ""
    }
    
}
