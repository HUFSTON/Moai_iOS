//
//  MyTownViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit
import Moya
class MyTownViewController: UIViewController, MTMapViewDelegate {
    
    let service = MoyaProvider<MyTownAPI>()
    let rankingIcon: [UIImage] = [UIImage.ranking1,
                                  UIImage.ranking2,
                                  UIImage.ranking3,
                                  UIImage.ranking4,
                                  UIImage.ranking5]

    var MyTownData: [MyTownModel] = []
    
    var mapView: MTMapView?
    var modalView: MyTownModalViewController?

    var maximumHeight: CGFloat?
    var minimumHeight: CGFloat?

    @IBOutlet var mapBackgroundView: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var containerViewHeight: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeData()
        expandContainerView(maximumHeight ?? 0)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        containerView.addGestureRecognizer(panGesture)
        self.containerView.autoresizesSubviews = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.getMyTown()
    }
    
    private func initializeData() {
        self.maximumHeight = self.view.frame.height * 0.55
        self.minimumHeight =  self.view.frame.height * 0.2
    }
    
    private func shrinkContainerView(_ value : CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.containerViewHeight.constant = value
            self.containerView.layoutIfNeeded()

        }
    }
    
    private func expandContainerView(_ value : CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.containerViewHeight.constant = value
            self.containerView.layoutIfNeeded()
        }
    }
    
    private func getMyTown() {
        service.request(MyTownAPI.getMyTown) { [weak self] result in
            guard let self = self else {
                return 
            }
            switch result{
            case .success(let response):
         
                do {
                    let data = try JSONDecoder().decode([MyTownModel].self, from: response.data)
                    self.MyTownData = data
                    self.initializeMap()
                    self.ModalView()
                    
                } catch(let err) {
        
                    print(err.localizedDescription)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)

        guard let maximum = maximumHeight, let minimum = minimumHeight else {
            return
        }

        if minimum <= self.containerView.frame.height - translation.y && self.containerView.frame.height - translation.y <= maximum {
            self.containerViewHeight.constant = self.containerView.frame.height - translation.y
        }

        if sender.state == .ended {
            if self.containerView.frame.height > (maximum - minimum) / 2 + minimum {
                UIView.animate(withDuration: 0.3) {
                    self.expandContainerView(maximum)
                }
                
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.shrinkContainerView(minimum)

                }
            }
        }
    }

    private func ModalView() {
        let storyboard = UIStoryboard(name: Constants.Storyboards.myTownModal, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: Constants.ViewControllers.myTownModalViewController) as? MyTownModalViewController else {
            return
        }
        addChild(vc)
        vc.view.round(corners: [.topLeft, .topRight], cornerRadius: 15)
        vc.MyTownData = MyTownData
        vc.view.frame = self.containerView.bounds
        self.containerView.addSubview(vc.view)
    }

    private func initializeMap(){
        mapView = MTMapView(frame: self.mapBackgroundView.bounds)
        guard let map = mapView else {
            return
        }
                
        mapBackgroundView.addSubview(map)
        
        map.delegate = self
        map.baseMapType = .standard
        map.addPOIItems(initializeMapMarker())
        map.clipsToBounds = true
        map.fitAreaToShowAllPOIItems()
        map.zoomOut(animated: true)
        map.setZoomLevel(map.zoomLevel + MTMapZoomLevel(1.0), animated: true)
    }
    
    private func initializeMapMarker() -> [MTMapPOIItem] {
        var mapItem: [MTMapPOIItem] = []
        for i in 0..<MyTownData.count {
            let marker : MTMapPOIItem = MTMapPOIItem()
            marker.markerType = .customImage
            marker.customImage = rankingIcon[i]
            marker.mapPoint = .init(geoCoord: .init(latitude: MyTownData[i].latitude, longitude: MyTownData[i].longitude))
            marker.markerSelectedType = .customImage
            marker.customSelectedImage = rankingIcon[i]
            marker.tag = i
            mapItem.append(marker)
        }
        
        return mapItem
    }
    
    func mapView(_ mapView: MTMapView!, selectedPOIItem poiItem: MTMapPOIItem!) -> Bool {
        return false
    }

}

extension MyTownViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        MyTownModalPresentationController(presentedViewController: presented,
                                          presenting: presenting)
    }
}
