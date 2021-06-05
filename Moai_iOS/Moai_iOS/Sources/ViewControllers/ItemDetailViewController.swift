//
//  ItemDetailViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/04/29.
//

import UIKit

class ItemDetailViewController: UIViewController, MTMapViewDelegate {

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
    
    var mapView: MTMapView?
    var paymentModal: PaymentViewController?
    var count: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeMap()
        self.initializeStyle()
        self.registerCell()
        self.registerDelegateDatasource()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeNavigationController()
    }
    
    
    // MARK: - Private Function
    
    private func initializeNavigationController() {
        self.navigationController?.isNavigationBarHidden = false
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(popToHomeViewController))
        leftButton.tintColor = UIColor.Black1
        self.navigationItem.leftBarButtonItem = leftButton
        
    }
    
    
    private func initializeMap(){
        mapView = MTMapView(frame: self.mapBackgroundView.bounds)
        guard let map = mapView else {
            return
        }
        map.delegate = self
        map.baseMapType = .standard
        map.addPOIItems(initializeMapMarker())
        map.fitAreaToShowAllPOIItems()
        map.setZoomLevel(MTMapZoomLevel(-2), animated: true)
        mapBackgroundView.addSubview(map)
    }
    private func initializeMapMarker() -> [MTMapPOIItem] {
        let marker : MTMapPOIItem = MTMapPOIItem()
        marker.markerType = .customImage
        marker.customImage = UIImage(named: "Location")
        marker.mapPoint = MTMapPoint(geoCoord:MTMapPointGeo(latitude: 37.596966, longitude:  127.058972))
        marker.markerSelectedType = .customImage
        marker.customSelectedImage = UIImage(named: "Location")
        
        return [marker]
    }
    
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
    
    // MARK: - OBJC Func
    @objc private func popToHomeViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - @IBActions
    
    @IBAction func changePageControlValue(_ sender: UIPageControl) {
        let index = sender.currentPage
        self.imageCollectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    
    @IBAction func touchMinusButton(_ sender: Any) {
        if count - 1 >= 2 {
            count -= 1
            self.minusButton.isEnabled = true
            self.plusButton.isEnabled = true
        } else {
            count -= 1
            self.minusButton.isEnabled = false
        }
        self.countLabel.text = String(count)
    }
    
    @IBAction func touchPlusButton(_ sender: Any) {
        if count + 1 < 10 {
            count += 1
            self.plusButton.isEnabled = true
            self.minusButton.isEnabled = true
        } else {
            count += 1
            self.plusButton.isEnabled = false
        }
        self.countLabel.text = String(count)
    }
    
    @IBAction func touchReserveButton(_ sender: Any) {
        paymentModal = PaymentViewController()
        guard let modal = paymentModal else {
            return
        }
        modal.modalPresentationStyle = .custom
        modal.transitioningDelegate = self
        modal.pointOrigin =  CGPoint(x: 0,
                                     y: self.view.frame.height - 450)
        self.present(modal, animated: true, completion: nil)

    }
}

extension ItemDetailViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PaymentPresentationController(presentedViewController: presented, presenting: presenting)
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
