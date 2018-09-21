//
//  Extention.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/13/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

extension UITextField {
    func setIsOnFocus(_ isOnFocus: Bool) {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(1.0)
        
        border.borderColor = isOnFocus ? UIColor.pumpkinOrange.cgColor : UIColor.silver.cgColor
        
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        self.textColor = isOnFocus ? UIColor.frenchBlue : UIColor.steelGrey
    }
}
