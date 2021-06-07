//
//  SignupViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import UIKit
import Moya

class SignupViewController: UIViewController {
    
    let service = MoyaProvider<UsersAPI>()
    
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
    
    private func verifyParam() {
        guard let email = emailTextField.text ,
              let pw = pwTextField.text,
              let confirmPW = confirmPwTextField.text,
              let name = nameTextField.text,
              let phone = phoneTextField.text else {
            return
        }
        if [email,pw,confirmPW, name, phone].contains("") {
            self.makeAlert(title: "회원가입 실패", message: "정보가 부족합니다", okAction: nil, completion: nil)
            return
        }
        if pw != confirmPW {
            self.makeAlert(title: "회원가입 실패", message: "비밀번호가 다릅니다", okAction: nil, completion: nil)
            return
        }
        print(1)
        self.registerAccount(email: email, pw: pw, name: name, phone: phone)
    }
    
    private func popToLogin(_ action: UIAlertAction) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func registerAccount(email: String,
                                 pw: String,
                                 name: String,
                                 phone: String) {
        service.request(UsersAPI.register(email: email,
                                          password: pw,
                                          name: name,
                                          phone: phone)) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let response):
                print(response)
                do {
                    let data = try JSONDecoder().decode(SignupModel.self, from: response.data)
                    self.makeAlert(title: "🙈 회원가입 성공 🙈",
                                   message: "가입이 완료되었습니다",
                                   okAction: self.popToLogin(_:),
                                   completion: nil)
                } catch(let err) {
                    print(err.localizedDescription)
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
    }
    
    @IBAction func touchSignupButton(_ sender: Any) {
        self.verifyParam()
    }
    
}

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
