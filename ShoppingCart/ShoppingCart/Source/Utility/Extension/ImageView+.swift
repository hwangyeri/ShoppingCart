//
//  ImageView+.swift
//  ShoppingCart
//
//  Created by Yeri Hwang on 2024/01/30.
//

import UIKit
import Kingfisher

extension UIImageView {
     
    // 이미지 효율적으로 로드하고 표시할 수 있도록 설계
    // 메모리 사용량을 줄이기 위해서 이미지 다운샘플링 처리
    
    func setImage(withURL imageUrl: String) {
        
        // 캐싱 목적으로 원본 이미지 디스크에 저장
        var options: KingfisherOptionsInfo = [
            .cacheOriginalImage
        ]
        
        // 메모리 사용량을 줄이기 위해서 이미지 다운샘플링 처리
        options.append(.processor(DownsamplingImageProcessor(size: CGSize(width: 100, height: 100))))
        
        // 이미지 품질을 향상 시키기 위해서 기기 화면에 맞는 배율 지정
        options.append(.scaleFactor(UIScreen.main.scale))
        
        self.kf.setImage(
            with: URL(string: imageUrl),
            placeholder: UIImage(named: "shoppingCart"),
            options: options
        )
    }
    
}
