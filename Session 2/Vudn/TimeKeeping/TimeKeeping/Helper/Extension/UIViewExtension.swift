//
//  UIViewExtension.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/21/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

extension UIView {
    func setIsOnSelect(_ isOnSelect: Bool) {
        self.backgroundColor = isOnSelect ? UIColor.darkSlateBlue : UIColor.frenchBlue
        
        let border = CALayer()
        let width = CGFloat(4.0)
        border.borderColor = isOnSelect ? UIColor.white.cgColor : UIColor.frenchBlue.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
