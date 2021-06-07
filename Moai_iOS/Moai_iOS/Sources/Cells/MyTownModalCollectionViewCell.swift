//
//  MyTownModalCollectionViewCell.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/05.
//

import UIKit

class MyTownModalCollectionViewCell: UICollectionViewCell {

    @IBOutlet var rankingLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var storeNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.rankingLabel.layer.cornerRadius = 8
        // Initialization code
    }
    
    func initializeCell(data: MyTownModel, rank: Int) {
        self.rankingLabel.text = "\(rank)"
        self.storeNameLabel.text = data.shopName
    }
}
