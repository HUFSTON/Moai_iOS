//
//  MyTownViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit

class MyTownViewController: UIViewController, MTMapViewDelegate {

    @IBOutlet var mapBackgroundView: UIView!
    
    var mapView: MTMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeMap()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
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
