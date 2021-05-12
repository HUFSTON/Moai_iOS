//
//  MyPageTableViewCell.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/12.
//

import UIKit

class MyPageTableViewCell: UITableViewCell {

    @IBOutlet var myPageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
