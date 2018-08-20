//
//  Extension.swift
//  Session2
//
//  Created by admin on 8/14/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

// MARK: control textfield
extension UITextField {
    func setIsOnFocus(_ isOnFocus: Bool) {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = isOnFocus ? UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0).cgColor :
            UIColor.init(red: 180/255, green: 182/255, blue: 197/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,
                              width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        self.textColor = isOnFocus ? UIColor.init(
            red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0) :
            UIColor.init(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
        
    }
}
extension UIColor {
    @nonobjc class var pumpkinOrange: UIColor {
        return UIColor(red: 242.0 / 255.0, green: 139.0 / 255.0, blue: 15.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var frenchBlue: UIColor {
        return UIColor(red: 63.0 / 255.0, green: 95.0 / 255.0, blue: 163.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var steelGrey: UIColor {
        return UIColor(red: 120.0 / 255.0, green: 131.0 / 255.0, blue: 140.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var darkSlateBlue: UIColor {
        return UIColor(red: 35.0 / 255.0, green: 61.0 / 255.0, blue: 117.0 / 255.0, alpha: 1.0)
    }
}
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
