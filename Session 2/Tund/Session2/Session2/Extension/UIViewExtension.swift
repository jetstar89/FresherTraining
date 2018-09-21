//
//  UIViewExtension.swift
//  Session2
//
//  Created by admin on 8/22/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension UIView {
    func setIsOnExpand(_ isOnExpand: Bool) {
        self.backgroundColor = isOnExpand ? UIColor.init(
            red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0) : UIColor.white
    }
    func iSelected(_ isSelected: Bool) {
        self.backgroundColor = isSelected ? UIColor(red: 35/255,
                                                    green: 61/255,
                                                    blue: 117/255,
                                                    alpha: 1):
            UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
        let border = CALayer()
        let width = CGFloat(3.0)
        border.borderColor = isSelected ? UIColor.white.cgColor : UIColor.frenchBlue.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

