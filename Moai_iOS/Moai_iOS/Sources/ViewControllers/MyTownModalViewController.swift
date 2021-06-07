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
    
    @IBOutlet var rangeLabel: UILabel!
    @IBOutlet weak var myTownModalCollectionView: UICollectionView!
    var maximumFrame: CGRect?
    var minimumFrame: CGRect?
    
    var MyTownData: [MyTownModel] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        self.myTownModalCollectionView.delegate = self
        self.myTownModalCollectionView.dataSource = self
        let temp = "500m 반경 판매량 기준"
        let attributedString = NSMutableAttributedString(string: temp)
        attributedString.addAttribute(.foregroundColor,
                                      value: UIColor.DarkGreen,
                                      range: (temp as NSString).range(of: "500m"))
                                      
        attributedString.addAttribute(.foregroundColor,
                                      value: UIColor.DarkGreen,
                                      range: (temp as NSString).range(of: "판매량"))
        
        
        self.rangeLabel.attributedText = attributedString
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func registerCell() {
        self.myTownModalCollectionView.register(UINib(nibName: Constants.Cells.myTownModalCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.myTownModalCollectionViewCell)
    }
    
//    private func pushToItemDetail(num: Int) {
//        let storyboard = UIStoryboard(name: Constants.Storyboards.itemDetail, bundle: nil)
//        guard let vc = storyboard.instantiateViewController(identifier: Constants.ViewControllers.itemDetailViewController) as? ItemDetailViewController else {
//            return
//        }
////        vc.productId = MyTownData[num].
//        self.navigationController?.pushViewController(vc, animated: true)
//
//    }
    
    
}

extension MyTownModalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MyTownData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.myTownModalCollectionViewCell, for: indexPath) as? MyTownModalCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.initializeCell(data: MyTownData[indexPath.item], rank: indexPath.item + 1)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
