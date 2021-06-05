//
//  MyTownModalPresentationController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/05.
//

import UIKit



class MyTownModalPresentationController: UIPresentationController {
    
    var tabbarHeight: CGFloat = StartTabBarController.height
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
       
    }

    override func presentationTransitionWillBegin() {
        self.presentedViewController.view.round(corners: [.topLeft, .topRight], cornerRadius: 15)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        CGRect(origin: CGPoint(x: 0,
                               y: self.containerView!.frame.height - 413),
               size: CGSize(width: self.containerView!.frame.width,
                            height: 413))
    }
    
    override func containerViewDidLayoutSubviews() {
        super .containerViewDidLayoutSubviews()
        
    }
}
