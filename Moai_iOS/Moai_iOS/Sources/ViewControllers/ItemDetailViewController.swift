//
//  ItemDetailViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/04/29.
//

import UIKit

class ItemDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var discountRateLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var soldOutLabel: UILabel!
    @IBOutlet weak var invenLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var returnAlertLabel: UILabel!
    @IBOutlet weak var reserveButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var sellerImageView: UIImageView!
    @IBOutlet weak var sellerNameLabel: UILabel!
    @IBOutlet weak var mapBackgroundView: UIView!
    @IBOutlet weak var pickupTimeLabel: UILabel!
    @IBOutlet weak var pickupPlaceLabel: UILabel!
    @IBOutlet weak var returnDetailLabel: UILabel!
    @IBOutlet weak var returnWarningLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeStyle()
        self.registerCell()
        self.registerDelegateDatasource()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Private Function
    
    // collectionView에 셀 등록
    private func registerCell() {
        self.imageCollectionView.register(UINib(nibName: Constants.Cells.imageCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.imageCollectionViewCell)
    }
    
    // delegate & datasource 처리
    private func registerDelegateDatasource() {
        self.imageCollectionView.delegate = self
        self.imageCollectionView.dataSource = self
    }
    
    // 뷰 스타일 초기화
    private func initializeStyle() {
        initializeLabels()
        initializeButtons()
        initializeImageView()
        initializePageControl()
    }
    
    private func initializePageControl() {
        self.imagePageControl.backgroundStyle = .prominent
        self.imagePageControl.currentPageIndicatorTintColor = .DarkGreen
        self.imagePageControl.hidesForSinglePage = true
        self.imagePageControl.numberOfPages = 9
    }
    
    private func initializeLabels() {
        self.soldOutLabel.layer.cornerRadius = 10
        self.returnAlertLabel.layer.cornerRadius = 10
    }
    
    private func initializeImageView() {
        self.sellerImageView.layer.cornerRadius = self.sellerImageView.frame.height/2
    }
    
    private func initializeButtons() {
        self.reserveButton.layer.cornerRadius = 15
        self.plusButton.layer.borderWidth = 1
        self.plusButton.layer.borderColor = UIColor.LightGray2.cgColor
        self.minusButton.layer.borderWidth = 1
        self.minusButton.layer.borderColor = UIColor.LightGray2.cgColor
        self.plusButton.layer.cornerRadius = 10
        self.minusButton.layer.cornerRadius = 10
        self.minusButton.isEnabled = false
    }
    
    // MARK: - @IBActions
    
    @IBAction func changePageControlValue(_ sender: UIPageControl) {
        let index = sender.currentPage
        self.imageCollectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    
    @IBAction func touchMinusButton(_ sender: Any) {
        
    }
    
    @IBAction func touchPlusButton(_ sender: Any) {
    }
    
    @IBAction func touchReserveButton(_ sender: Any) {

    }
}

extension ItemDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.imageCollectionViewCell, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateImageView("https://cdn.pixabay.com/photo/2018/07/18/19/12/spaghetti-3547078__340.jpg")
        return cell
    }
    
    
}

extension ItemDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? ImageCollectionViewCell else {
            return
        }
        cell.imageView.kf.cancelDownloadTask()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / scrollView.frame.width)
        self.imagePageControl.currentPage = index
    }
}
