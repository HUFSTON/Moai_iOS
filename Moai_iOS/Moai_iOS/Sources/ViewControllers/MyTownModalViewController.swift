//
//  MyTownModalViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/05.
//

import UIKit

//enum ModalType: Int {
//    case long = 1
//    case short
//}

class MyTownModalViewController: UIViewController {
    
    @IBOutlet weak var myTownModalCollectionView: UICollectionView!
    var maximumFrame: CGRect?
    var minimumFrame: CGRect?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        self.myTownModalCollectionView.delegate = self
        self.myTownModalCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func registerCell() {
        self.myTownModalCollectionView.register(UINib(nibName: Constants.Cells.myTownModalCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.myTownModalCollectionViewCell)
    }

}

extension MyTownModalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.myTownModalCollectionViewCell, for: indexPath) as? MyTownModalCollectionViewCell else {
            return UICollectionViewCell()
        }

        return cell
    }
    
    
}

extension MyTownModalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
