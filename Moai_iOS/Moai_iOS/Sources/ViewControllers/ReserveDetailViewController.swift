//
//  ReserveDetailViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit

enum category: Int {
    case reserved = 0
    case received = 1
}

class ReserveDetailViewController: UIViewController {
    
    var selectedCategory: category = .reserved

    // MARK: - IBOutlets
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "예약내역"
        self.registerCells()
        self.registerDelegateDatasource()
        self.removeChildrenView()
        self.addReserveProceedingVC()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    // MARK: - Private Functions
    
    // register delegate and datasource
    private func registerDelegateDatasource() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    private func registerCells() {
        self.categoryCollectionView.register(UINib(nibName: Constants.Cells.categoryCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.categoryCollectionViewCell)
    }
    
    private func removeChildrenView() {
        for vc in children {
            vc.view.removeFromSuperview()
            vc.removeFromParent()
        }
    }
    
    private func addReserveProceedingVC() {
        guard let vc = storyboard?.instantiateViewController(identifier: Constants.ViewControllers.reserveProceedingViewController) as? ReserveProceedingViewController else {
            return
        }
        addChild(vc)
        vc.view.frame = self.containerView.bounds
        self.containerView.addSubview(vc.view)
    }
    private func addReceivedVC() {
        guard let vc = storyboard?.instantiateViewController(identifier: Constants.ViewControllers.receivedViewController) as? ReceivedViewController else {
            return
        }
        addChild(vc)
        vc.view.frame = self.containerView.bounds
        self.containerView.addSubview(vc.view)
    }
    
}

extension ReserveDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.categoryCollectionViewCell, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        if indexPath.item % 2 == 0 {
            cell.initializeData("진행중", "5", false)
            cell.isSelected = true
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
        } else {
            cell.initializeData("수령 완료", "0", true)
        }
        return cell

    }
    
}

extension ReserveDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedCategory.rawValue == indexPath.item {
            return
        }
        if indexPath.item == 0 {
            removeChildrenView()
            addReserveProceedingVC()
            self.selectedCategory = .reserved
        } else {
            removeChildrenView()
            addReceivedVC()
            self.selectedCategory = .received
        }
        
    }
}
