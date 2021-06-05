//
//  UIVIew+Extension.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/05.
//

import UIKit

extension UIView {
    func round(corners: UIRectCorner, cornerRadius: Double) {
            let size = CGSize(width: cornerRadius, height: cornerRadius)
            let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
            let shapeLayer = CAShapeLayer()
            shapeLayer.frame = self.bounds
            shapeLayer.path = bezierPath.cgPath
            self.layer.mask = shapeLayer
        }
}
