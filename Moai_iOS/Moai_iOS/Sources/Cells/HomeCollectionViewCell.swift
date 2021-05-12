//
//  HomeCollectionViewCell.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/04/29.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var SellerNameLabel: UILabel!
    
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var discountRateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.itemImageView.layer.cornerRadius = 15;
        // Initialization code
    }
    
    func initializeView(_ imagePath: String) {
        self.itemImageView.updateServerImage(imagePath)
    }
    
    

}
