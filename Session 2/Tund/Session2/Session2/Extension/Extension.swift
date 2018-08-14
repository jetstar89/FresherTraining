//
//  Extension.swift
//  Session2
//
//  Created by admin on 8/14/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

//MARK: control textfield
extension UITextField {
    
    func setIsOnFocus(_ isOnFocus: Bool) {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(1.0)
        
        border.borderColor = isOnFocus ? UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0).cgColor : UIColor.init(red: 180/255, green: 182/255, blue: 197/255, alpha: 1.0).cgColor
        
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        self.textColor = isOnFocus ? UIColor.init(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0) : UIColor.init(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
    }
    
    
    
    
}
extension UIView {
    func setIsOnSelect(_ isOnSelect: Bool) {
        self.backgroundColor = isOnSelect ? UIColor.darkGray : UIColor.init(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
        
        let border = CALayer()
        let width = CGFloat(4.0)
        border.borderColor = isOnSelect ? UIColor.white.cgColor : UIColor.init(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setIsOnExpand(_ isOnExpand: Bool) {
        self.backgroundColor = isOnExpand ? UIColor.init(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0) : UIColor.white
        
        
        
    }
}
extension UITableViewCell {
    func setIsTableViewExpand(_ isOnExpand: Bool) {
        self.backgroundColor = isOnExpand ? UIColor.init(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0) : UIColor.white
        guard let view: WeekTableViewCell = self as? WeekTableViewCell else {
            return
        }
        view.countDayLabel.textColor = isOnExpand ? UIColor.white : UIColor.black
        view.weekLabel.textColor = isOnExpand ? UIColor.white : UIColor.black
        view.dayLabel.textColor = isOnExpand ? UIColor.white : UIColor.black
        view.expandImageView.image = isOnExpand ? #imageLiteral(resourceName: "expand-close"): #imageLiteral(resourceName: "expand-open")
        
        
    }
}

