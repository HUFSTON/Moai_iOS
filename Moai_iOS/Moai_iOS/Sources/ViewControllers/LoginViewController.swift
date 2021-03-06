//
//  LoginViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/05.
//

import UIKit
import Moya

class LoginViewController: UIViewController {

    let service = MoyaProvider<UsersAPI>()
    
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
        if UserDefaults.standard.object(forKey: "token") != nil {
            pushToStart()
        } else {
            initializeViewShape()
            assignDelegate()
        }
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
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
        
    private func pushToStart() {
        let storyboard = UIStoryboard(name: Constants.Storyboards.start, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: Constants.TabbarControllers.startTabBarController) as? StartTabBarController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
    private func verifyParam() {
        guard let id = idTextField.text, let pw = pwTextField.text else {
            return
        }
        if id != "" || pw != "" {
            LoginAPI(email: id, password: pw)
        } else {
            self.makeAlert(title: "로그인 실패", message: "정보가 부족합니다", okAction: nil, completion: nil)
        }
    }
        
    private func LoginAPI(email: String, password: String) {
        service.request(UsersAPI.login(email: email, password: password)) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let response):
                do {
                    let login = try JSONDecoder().decode(Login.self, from: response.data)
                    print(login.token)
                    print(login.isSeller)
                    UserDefaults.standard.setValue(login.token, forKey: "token")
                    UserDefaults.standard.setValue(login.isSeller, forKey: "isSeller")
        
                    self.pushToStart()
                } catch(let err) {
                    self.makeAlert(title: "로그인 실패", message: "정보가 유효하지 않습니다", okAction: nil, completion: nil)
                    print(err.localizedDescription)
                }
            case .failure(let err):
                self.makeAlert(title: "로그인 실패", message: "서버통신이 원활하지 않습니다", okAction: nil, completion: nil)
                print(err.localizedDescription)
            }
                
        }
    }
    
    private func pushToSignup() {
        let storyboard = UIStoryboard(name: Constants.Storyboards.signup, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: Constants.ViewControllers.signupViewController) as? SignupViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
        
    @IBAction func touchLoginButton(_ sender: Any) {
        self.verifyParam()
    }
        
    
    @IBAction func touchSignupButton(_ sender: Any) {
        pushToSignup()
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
