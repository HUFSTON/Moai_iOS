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
        initiailizeMap()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func initiailizeMap(){
        mapView = MTMapView(frame: self.mapBackgroundView.bounds)
        guard let map = mapView else {
            return
        }
        map.delegate = self
        map.baseMapType = .standard
        map.fitAreaToShowAllPOIItems()
        mapBackgroundView.addSubview(map)
    }

}
