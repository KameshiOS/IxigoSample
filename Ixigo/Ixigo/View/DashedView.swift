//
//  DashedView.swift
//  Ixigo
//
//  Created by Kamesh on 29/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

@IBDesignable class DashedView: UIView {
    @IBInspectable var lineColor: UIColor? {
        didSet {
            updateView()
        }
    }
    func updateView() {
        let rect = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height)
        let layer = CAShapeLayer()
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 8)
        layer.path = path.cgPath
        layer.strokeColor = lineColor?.cgColor
        layer.lineDashPattern = [5, 5, 5, 5, 5]
        layer.backgroundColor = UIColor.clear.cgColor
        layer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(layer)
        
    }
    
    override func prepareForInterfaceBuilder() {
        updateView()
    }
}
