//
//  MyPageUserViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/06.
//

import UIKit

class MyPageUserViewController: UIViewController {

    // MARK: - IBoutlets
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var pointLabel: UILabel!
    @IBOutlet var profileEditButton: UIButton!
    @IBOutlet var chargeButton: UIButton!
    @IBOutlet var UIViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        initializeButtons()
        initializeGestureRecognizer()
    }

    // MARK: - Private Function
    private func initializeViews() {
        UIViews.forEach{
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1.0).cgColor
        }
    }
    
    private func initializeButtons() {
        self.chargeButton.layer.cornerRadius = 7
        self.profileEditButton.layer.cornerRadius = 7
        
    }
    
    private func initializeGestureRecognizer() {
        UIViews[2].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchRegisterView)))
        UIViews[3].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchTermView)))
    }
    
    // MARK: - objc Function
    
    @objc func touchRegisterView() {
        
    }
    
    @objc func touchTermView() {
        
    }
    
    // MARK: - IBAction
    
    @IBAction func touchProfileEditButton(_ sender: Any) {
    }
    
    @IBAction func touchChargeButton(_ sender: Any) {
    }
    
    @IBAction func touchQuitButton(_ sender: Any) {
    }
}
