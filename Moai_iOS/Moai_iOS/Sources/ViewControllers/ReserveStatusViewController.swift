//
//  ReserveStatusViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/04.
//

import UIKit

enum Status: Int {
    case Reserved = 0
    case Ready = 1
    case Waiting = 2
    case Received = 3
}

class ReserveStatusViewController: UIViewController, MTMapViewDelegate {
    
    @IBOutlet var greenDots: [UIView]?
    @IBOutlet var statusImage: [UIImageView]?
    @IBOutlet var statusLabel: [UILabel]?
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var deliveryPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var receiveTimeLabel: UILabel!
    @IBOutlet weak var receivePlaceLabel: UILabel!
    @IBOutlet var mapBackgroundView: UIView!
    
    var currentStatus: Status = .Reserved
    var mapView: MTMapView?
    
    
    
    
    override func viewDidLoad() {
        roundGreenDotCorner()
        initializeViews()
        super.viewDidLoad()
    }
    
    private func initializeMap() {
        mapView = MTMapView(frame: self.mapBackgroundView.bounds)
        guard let map = mapView else {
            return
        }
        mapBackgroundView.addSubview(map)
    }
    
    private func roundGreenDotCorner() {
        guard let dots = greenDots else {
            return
        }
        for i in 0..<dots.count {
            dots[i].layer.cornerRadius = 3
        }

    }
    
    private func initializeViews() {
        guard let dots = greenDots, let image = statusImage, let label = statusLabel else {
            return
        }
        for idx in 0..<currentStatus.rawValue {
            dots[idx].isHidden = true
            image[idx].image = UIImage()
            label[idx].attributedText = NSMutableAttributedString(string: "dsd", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)])
        }
        dots[currentStatus.rawValue].isHidden = true
        image[currentStatus.rawValue].image = UIImage()
        label[currentStatus.rawValue].attributedText =
            NSMutableAttributedString(string: "dzdzzz", attributes: [NSAttributedString.Key.foregroundColor: UIColor.DarkGreen,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
        
        for idx in (currentStatus.rawValue+1)..<4{
            dots[idx].isHidden = false
            image[idx].image = UIImage()
            label[idx].attributedText = NSMutableAttributedString(string: "dsd", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)])
        }
    }
}
