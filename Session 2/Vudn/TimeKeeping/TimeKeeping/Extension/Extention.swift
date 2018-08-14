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

extension UIColor {
    @nonobjc class var pumpkinOrange: UIColor {
        return UIColor(red: 242.0 / 255.0, green: 139.0 / 255.0, blue: 15.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var black50: UIColor {
        return UIColor(white: 0.0, alpha: 0.5)
    }
    
    @nonobjc class var white: UIColor {
        return UIColor(white: 1.0, alpha: 1.0)
    }
    
    @nonobjc class var frenchBlue: UIColor {
        return UIColor(red: 63.0 / 255.0, green: 95.0 / 255.0, blue: 163.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var steelGrey: UIColor {
        return UIColor(red: 120.0 / 255.0, green: 131.0 / 255.0, blue: 140.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var silver: UIColor {
        return UIColor(red: 180.0 / 255.0, green: 182.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var darkSlateBlue: UIColor {
        return UIColor(red: 35.0 / 255.0, green: 61.0 / 255.0, blue: 117.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var watermelon: UIColor {
        return UIColor(red: 242.0 / 255.0, green: 81.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var windowsBlue: UIColor {
        return UIColor(red: 56.0 / 255.0, green: 102.0 / 255.0, blue: 201.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var squash: UIColor {
        return UIColor(red: 245.0 / 255.0, green: 166.0 / 255.0, blue: 35.0 / 255.0, alpha: 1.0)
    }
}

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

//extension UITableViewCell {
//    func setIsOnExpand(_ isOnExpand: Bool) {
//
//    }
//}
