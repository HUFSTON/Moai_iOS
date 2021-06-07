//
//  MyPageViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.removeChild()
        self.addMyPageUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- Private Function

    private func addMyPageUser() {
        let storyboard = UIStoryboard(name: Constants.Storyboards.myPageUser, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: Constants.ViewControllers.myPageUserViewController) as? MyPageUserViewController else {
            return
        }
        addChild(vc)
        vc.view.frame = self.containerView.bounds
        self.containerView.addSubview(vc.view)
    }
    
    private func addMyPageSeller() {
        let storyboard = UIStoryboard(name: Constants.Storyboards.myPageSeller, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: Constants.ViewControllers.myPageSellerViewController) as? MyPageSellerViewController else {
            return
        }
        addChild(vc)
        vc.view.frame = self.containerView.bounds
        self.containerView.addSubview(vc.view)
    }
    
    private func removeChild() {
        for vc in children {
            vc.view.removeFromSuperview()
            vc.removeFromParent()
        }
    }
}

