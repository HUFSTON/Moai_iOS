//
//  ReservedCollectionViewCell.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit

class ReservedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var GreenView: UIView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        GreenView.layer.cornerRadius = self.GreenView.frame.height/2
        // Initialization code
    }
    
    func initializeData(_ imagePath: String, _ sellerName: String, _ itemName: String, _ status: String) {
        
        itemImageView.updateServerImage(imagePath)
        sellerLabel.text = sellerName
        itemNameLabel.text = itemName
        statusLabel.text = status
    }
}
