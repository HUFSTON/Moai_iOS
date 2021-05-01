//
//  ReserveProceedingViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit

class ReserveProceedingViewController: UIViewController {

    @IBOutlet weak var reservedItemCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        registerDelegateDatasource()

        // Do any additional setup after loading the view.
    }
    
    private func registerDelegateDatasource() {
        reservedItemCollectionView.delegate = self
        reservedItemCollectionView.dataSource = self
    }
    
    private func registerCells() {
        self.reservedItemCollectionView.register(UINib(nibName: Constants.Cells.reservedCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.reservedCollectionViewCell)
        self.reservedItemCollectionView.register(UINib(nibName: Constants.Reusable.reserveHeaderCollectionReusableView, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.Reusable.reserveHeaderCollectionReusableView)
    }
}

extension ReserveProceedingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.reservedCollectionViewCell, for: indexPath) as? ReservedCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let reusable = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.Reusable.reserveHeaderCollectionReusableView, for: indexPath) as? ReserveHeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        return reusable
    }
    
    
}

extension ReserveProceedingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 26)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? ReservedCollectionViewCell else {
            return
        }
        cell.itemImageView.kf.cancelDownloadTask()
    }
}
