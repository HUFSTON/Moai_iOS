//
//  ImageCollectionViewCell.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/04/29.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateImageView(_ imagePath: String) {
        
        self.imageView.updateServerImage(imagePath)
    }

}
