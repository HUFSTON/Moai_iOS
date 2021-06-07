//
//  PaymentViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/05.
//

import UIKit
import Moya

class PaymentViewController: UIViewController {
    
    let service = MoyaProvider<ChangeAPI>()
    
    var pointOrigin: CGPoint?
    var value: Int = 0
    var address: String = ""
    var discoutedPrice: Int = 0
    var refundPrice: Int = 0

    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var pointLabel: UILabel!
    @IBOutlet var purchaseLabel: UILabel!
    @IBOutlet var warningLabel: UITextView!
    @IBOutlet var payButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        self.payButton.layer.cornerRadius = 15
        getChange()
    }

    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard translation.y >= 0 else {
            return
        }
        
        guard let origin = pointOrigin else {
            return
        }
        
        view.frame.origin = CGPoint(x: 0, y: origin.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1330 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = origin
                }
            }
        }
    }
    
    private func updateData() {
        self.addressLabel.text = self.address
        self.pointLabel.text = "\(self.value) 포인트"
        self.warningLabel.text = "재고 부족 및 기타 매장 상황으로 인해 상품을 받지 못하는 경우 총 \(self.refundPrice)원을 환급해 드립니다. 단순 변심 혹은 개인 과실로 인해 상품을 받지 못하는 경우에는 환급금을 지급하지 않습니다."
        self.purchaseLabel.text = "\(self.discoutedPrice) 원"
    }
    
    private func getChange() {
        service.request(ChangeAPI.getChange){ [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder().decode(GetChangeModel.self, from: response.data)
                    self?.value = data.value
                    self?.updateData()
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
