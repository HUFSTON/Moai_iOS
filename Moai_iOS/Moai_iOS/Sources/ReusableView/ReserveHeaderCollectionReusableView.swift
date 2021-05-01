//
//  ReserveHeaderCollectionReusableView.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit

class ReserveHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initializeData(_ date: String) {
        dateLabel.text = date
    }
}
