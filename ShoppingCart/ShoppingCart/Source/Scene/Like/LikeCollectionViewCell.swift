//
//  LikeCollectionViewCell.swift
//  ShoppingCart
//
//  Created by Yeri Hwang on 2023/12/27.
//

import UIKit
import SnapKit

final class LikeCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = {
        let view = PhotoImageView(frame: .zero)
        return view
    }()
    
    let mallNameLabel = {
        let view = InfoLabel(
            fontWeight: .semiBold, fontSize: 15,
            textColor: Constants.BaseColor.text,
            numberOfLines: 1
        )
        // 언더라인 추가
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Mall Name", attributes: underlineAttribute)
        view.attributedText = underlineAttributedString
        return view
    }()
    
    let titleLabel = InfoLabel(
        fontWeight: .regular,
        fontSize: 14,
        textColor: .darkGray,
        numberOfLines: 2
    )
    
    let lPriceLabel = InfoLabel(
        fontWeight: .light, fontSize: 15,
        textColor: Constants.BaseColor.text,
        numberOfLines: 1
    )
    
    let likeDateLabel = InfoLabel(
        fontWeight: .light, fontSize: 14,
        textColor: Constants.BaseColor.subText,
        numberOfLines: 1
    )
    
    let likeButton = {
        let view = UIButton()
        view.tintColor = Constants.BaseColor.text
        view.contentMode = .scaleAspectFit
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 23, weight: .regular)
        let image = UIImage(systemName: "heart.fill", withConfiguration: imageConfig)
        view.setImage(image, for: .normal)
        return view
    }()
    
    
    override func configure() {
        [imageView, mallNameLabel, titleLabel, lPriceLabel, likeDateLabel,  likeButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.verticalEdges.equalToSuperview().inset(5)
            make.width.equalTo(contentView).multipliedBy(0.35)
        }
        
        mallNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(2)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mallNameLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(mallNameLabel)
        }
        
        lPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.horizontalEdges.equalTo(mallNameLabel)
        }
        
        likeDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(mallNameLabel)
            make.bottom.equalTo(likeButton)
        }
        
        likeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(18)
        }
        
    }
    
}
