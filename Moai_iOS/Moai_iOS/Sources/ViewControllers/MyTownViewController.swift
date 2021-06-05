//
//  MyTownViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit

class MyTownViewController: UIViewController, MTMapViewDelegate {

    @IBOutlet var mapBackgroundView: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var containerViewHeight: NSLayoutConstraint!
    
    var mapView: MTMapView?
    var modalView: MyTownModalViewController?

    var maximumHeight: CGFloat?
    var minimumHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeMap()
        ModalView()
        initializeData()
        expandContainerView(maximumHeight ?? 0)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        containerView.addGestureRecognizer(panGesture)
        self.containerView.autoresizesSubviews = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
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

        vc.view.frame = self.containerView.bounds
        self.containerView.addSubview(vc.view)
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
