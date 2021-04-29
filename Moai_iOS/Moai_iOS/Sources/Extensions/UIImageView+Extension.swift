//
//  UIImageView+Extension.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/04/29.
//

import UIKit
import Kingfisher

// 이미지 뷰 서버 통신
extension UIImageView {
    func updateServerImage(_ imagePath: String) {
        guard let url = URL(string: imagePath) else {
            return
        }
        let processor = RoundCornerImageProcessor(cornerRadius: 10)
        self.kf.indicatorType = .activity

        self.kf.setImage(
            with: url,
            placeholder: UIImage(),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
