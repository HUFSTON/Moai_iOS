//
//  APPConstants.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/04/29.
//

import Foundation

// 오타를 줄이기 위해 사용
struct Constants {
    
    struct Cells {
        static let homeCollectionViewCell: String = "HomeCollectionViewCell"
        static let imageCollectionViewCell: String = "ImageCollectionViewCell"
        static let categoryCollectionViewCell: String = "CategoryCollectionViewCell"
        static let reservedCollectionViewCell: String = "ReservedCollectionViewCell"
        static let searchTableViewCell: String = "SearchTableViewCell"
        static let myPageTableViewCell: String = "MyPageTableViewCell"
        static let myTownModalCollectionViewCell: String = "MyTownModalCollectionViewCell"
        
    }
    
    struct Reusable {
        static let reserveHeaderCollectionReusableView: String = "ReserveHeaderCollectionReusableView"
        static let emptyCollectionReusableView: String = "EmptyCollectionReusableView"
    }
    struct Storyboards {
        static let home: String = "Home"
        static let itemDetail: String = "ItemDetail"
        static let reserveDetail: String = "ReserveDetail"
        static let myTown: String = "MyTown"
        static let myPage: String = "MyPage"
        static let reserveStatus: String = "ReserveStatus"
        static let myTownModal: String = "MyTownModal"
        static let login: String = "Login"
        static let start: String = "Start"
        static let myPageSeller: String = "MyPageSeller"
        static let myPageUser: String = "MyPageUser"
        static let signup: String = "Signup"
    }
    
    struct ViewControllers {
        static let homeViewController: String = "HomeViewController"
        static let itemDetailViewController: String = "ItemDetailViewController"
        static let reserveDetailViewController: String = "ReserveDetailViewController"
        static let receivedViewController: String = "ReceivedViewController"
        static let reserveProceedingViewController: String = "ReserveProceedingViewController"
        static let myTownViewController: String = "MyTownViewController"
        static let myPageViewController: String = "MyPageViewController"
        static let reserveStatusViewController: String = "ReserveStatusViewController"
        static let myTownModalViewController: String = "MyTownModalViewController"
        static let loginViewController: String = "LoginViewController"
        static let myPageUserViewController: String = "MyPageUserViewController"
        static let myPageSellerViewController: String = "MyPageSellerViewController"
        static let signupViewController: String = "SignupViewController"
    }
    
    struct TabbarControllers {
        static let startTabBarController: String = "StartTabBarController"
    }
    
    struct Images {
        static let ranking1: String = "ranking1"
        static let ranking2: String = "ranking2"
        static let ranking3: String = "ranking3"
        static let ranking4: String = "ranking4"
        static let ranking5: String = "ranking5"
    }
}
