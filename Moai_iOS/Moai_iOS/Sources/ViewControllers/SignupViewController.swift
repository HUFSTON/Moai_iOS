//
//  SignupViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var confirmPwTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var UIViews: [UIView]!
    @IBOutlet var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeViews()
        self.registerDelegate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func initializeViews() {
        UIViews.forEach{
            $0.layer.cornerRadius = 15
        }
        self.signupButton.layer.cornerRadius = 15
    }
    
    private func registerDelegate() {
        self.emailTextField.delegate = self
        self.pwTextField.delegate = self
        self.confirmPwTextField.delegate = self
        self.nameTextField.delegate = self
        self.phoneTextField.delegate = self
    }
    
    @IBAction func touchSignupButton(_ sender: Any) {
    }
    
}

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
