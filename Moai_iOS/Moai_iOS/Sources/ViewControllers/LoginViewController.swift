//
//  LoginViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/05.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var idView: UIView!
    @IBOutlet var pwView: UIView!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewShape()
        assignDelegate()
    }
    
    private func assignDelegate() {
        idTextField.delegate = self
        pwTextField.delegate = self
    }
  
    private func initializeViewShape() {
        idView.layer.cornerRadius = 15
        pwView.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
    }

    @IBAction func touchLoginButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: Constants.Storyboards.start, bundle: nil)
    }
    
    
    @IBAction func touchSignupButton(_ sender: Any) {
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
