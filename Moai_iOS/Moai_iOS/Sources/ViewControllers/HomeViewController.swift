//
//  HomeViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/04/29.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var searchBackgroundView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var HomeCollectionView: UICollectionView!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewStyle()
        initializeMenu()
        registerCollectionViewCell()
        registerCollectionView()
//        @available (iOS 14.0, *)
        
    }
    // MARK: - Customize View
    private func initializeViewStyle() {
        self.searchBackgroundView.layer.cornerRadius = 10
        self.notificationButton.layer.borderWidth = 1
        self.notificationButton.layer.cornerRadius = 10
        self.notificationButton.layer.borderColor = UIColor.LightGray2.cgColor
    }
    
    private func initializeMenu() {
        if #available(iOS 14, *){
            let menu1 = UIAction(title: "menu1", state: .off, handler: {_ in print("1")})
            let menu2 = UIAction(title: "menu2", state: .off, handler: {_ in print("2")})
            filterButton.menu = UIMenu(title: "", image: UIImage(), identifier: .none, options: .displayInline, children: [menu1,menu2])
            filterButton.showsMenuAsPrimaryAction = true
        }
    }
    
    // MARK: - Register Delegate and DataSource
    private func registerCollectionView() {
        self.HomeCollectionView.delegate = self
        self.HomeCollectionView.dataSource = self
    }
    
    private func registerCollectionViewCell() {
        self.HomeCollectionView.register(UINib(nibName: Constants.Cells.HomeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.HomeCollectionViewCell)
    }
    
    // MARK: - IBActions
    
    @IBAction func touchSearchButton(_ sender: Any) {
    }
    
    @IBAction func touchNotificationButton(_ sender: Any) {
    }
}

// MARK: - UICollectionView Delegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? HomeCollectionViewCell else {
            return
        }
        cell.itemImageView.kf.cancelDownloadTask()
    }
    
}

// MARK: - UICollectionView DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.HomeCollectionViewCell, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.initializeView("https://cdn.pixabay.com/photo/2018/07/18/19/12/spaghetti-3547078__340.jpg")
        return cell
    }
}
