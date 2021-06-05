//
//  StartTabBarController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit

class StartTabBarController: UITabBarController {
    
    static var height: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = UIColor.DarkGreen
        setTabBar()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        StartTabBarController.height = tabBar.frame.size.height

    }

    private func setTabBar() {
        let homeStoryboard = UIStoryboard(name: Constants.Storyboards.home, bundle: nil)
        let myTownStoryboard = UIStoryboard(name: Constants.Storyboards.myTown, bundle: nil)
        let reserveDetailStoryboard = UIStoryboard(name: Constants.Storyboards.reserveDetail, bundle: nil)
        let myPageStoryboard = UIStoryboard(name: Constants.Storyboards.myPage, bundle: nil)
        
        guard let homeViewController = homeStoryboard.instantiateViewController(identifier: Constants.ViewControllers.homeViewController) as? HomeViewController,
              let myTownViewController = myTownStoryboard.instantiateViewController(identifier: Constants.ViewControllers.myTownViewController) as? MyTownViewController,
              let reserveDetailViewController = reserveDetailStoryboard.instantiateViewController(identifier: Constants.ViewControllers.reserveDetailViewController) as? ReserveDetailViewController,
              let myPageViewController = myPageStoryboard.instantiateViewController(identifier: Constants.ViewControllers.myPageViewController) as? MyPageViewController else {
            return
        }
        
        homeViewController.tabBarItem.title = "홈"
        homeViewController.tabBarItem.image = UIImage(systemName: "cart")
        homeViewController.tabBarItem.selectedImage = UIImage(systemName: "cart")?.withTintColor(UIColor.DarkGreen, renderingMode: .alwaysOriginal)
        
        myTownViewController.tabBarItem.title = "근처"
        myTownViewController.tabBarItem.image = UIImage(systemName: "pin")
        myTownViewController.tabBarItem.selectedImage = UIImage(systemName: "pin")?.withTintColor(UIColor.DarkGreen, renderingMode: .alwaysOriginal)
        
        reserveDetailViewController.tabBarItem.title = "예약"
        reserveDetailViewController.tabBarItem.image = UIImage(systemName: "checkmark.circle")
        reserveDetailViewController.tabBarItem.selectedImage = UIImage(systemName: "checkmark.circle")?.withTintColor(UIColor.DarkGreen, renderingMode: .alwaysOriginal)
        
        myPageViewController.tabBarItem.title = "계정"
        myPageViewController.tabBarItem.image = UIImage(systemName: "person")
        myPageViewController.tabBarItem.selectedImage = UIImage(systemName: "person")?.withTintColor(UIColor.DarkGreen, renderingMode: .alwaysOriginal)
        
        
        setViewControllers([homeViewController, myTownViewController, reserveDetailViewController, myPageViewController], animated: true)
    }
}
