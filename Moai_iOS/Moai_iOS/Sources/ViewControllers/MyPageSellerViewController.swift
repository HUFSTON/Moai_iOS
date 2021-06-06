//
//  MyPageSellerViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/06.
//

import UIKit

class MyPageSellerViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var editProfileButton: UIButton!
    @IBOutlet var pointLabel: UILabel!
    @IBOutlet var chargeButton: UIButton!
    @IBOutlet var UIViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        initializeButtons()
        initializeGestureRecognizer()
    }
    
    // MARK: - Private Functions
    
    private func initializeViews() {
        UIViews.forEach{
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.LightGray1.cgColor
        }
    }
    
    private func initializeButtons() {
        self.editProfileButton.layer.cornerRadius = 15
        self.chargeButton.layer.cornerRadius = 15
    }
    
    private func initializeGestureRecognizer() {
        UIViews[2].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchTermView)))
    }
    
    @objc func touchTermView() {
        
    }

    @IBAction func touchEditProfileButton(_ sender: Any) {
        
    }
    
    @IBAction func touchChargeButton(_ sender: Any) {
        
    }
    
    @IBAction func touchQuitButton(_ sender: Any) {
        
    }
    
    @IBAction func touchRegisterButton(_ sender: Any) { // 아이콘 추출되면 부착
    }
    
}
