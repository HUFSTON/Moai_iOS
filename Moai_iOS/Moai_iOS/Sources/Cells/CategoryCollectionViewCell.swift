//
//  CategoryCollectionViewCell.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    // 수령 완료 라벨 옆에는 수가 없기 때문에 이를 위한 변수 생성
    var verify = false
    // MARK: - IBOutlets
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var underBarView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isSelected: Bool {
        didSet {
            if !isSelected {
                self.underBarView.isHidden = true
                self.categoryNameLabel.textColor = UIColor.LightGray1
                self.countLabel.isHidden = true
            } else {
                self.underBarView.isHidden = false
                self.categoryNameLabel.textColor = UIColor.DarkGreen
                if !verify {
                    self.countLabel.isHidden = false
                }
                
            }
        }
    }
    
    func initializeData(_ name: String, _ cnt: String, _ verify: Bool) {
        self.countLabel.layer.cornerRadius = self.countLabel.frame.height/2
        categoryNameLabel.text = name
        self.verify = verify
        self.countLabel.text = cnt
        self.underBarView.isHidden = true
        if verify {
            self.countLabel.isHidden = true
        }
        
    }
}
