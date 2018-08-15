//
//  WeekTableViewCell.swift
//  Session2
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
protocol WeekTableDelegate: class {
    func touchSelection (header: WeekTableViewCell, section: Int)
    
}

class WeekTableViewCell: UITableViewHeaderFooterView {
    weak var delegate: WeekTableDelegate?
    var section: Int = 0
    
  
    @IBOutlet weak var headerView2: UIView!
    
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var countDayLabel: UILabel!
    @IBOutlet weak var expandImageView: UIImageView!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView(_:))))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView(_:))))
    }

    @objc func selectHeaderView(_ gesture: UITapGestureRecognizer) {
        let cell = gesture .view as! WeekTableViewCell
        delegate?.touchSelection(header: cell, section: cell.section)

    }
    
    func customInit(week: String, day: String, section: Int, isOnExpand: Bool, delegate: WeekTableDelegate) {
        self.weekLabel.text = week
        self.dayLabel.text = day
        self.section = section
        self.delegate = delegate
        isOnExpandHeader(isOnExpand)
      
       
    }
    
    func isOnExpandHeader(_ isOnExpand: Bool){
        self.headerView2.backgroundColor = isOnExpand ? UIColor.init(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0) : UIColor.white
       
        self.countDayLabel.textColor = isOnExpand ? UIColor.white : UIColor.black
        self.weekLabel.textColor = isOnExpand ? UIColor.white : UIColor.black
        self.dayLabel.textColor = isOnExpand ? UIColor.white : UIColor.black
        self.expandImageView.image = isOnExpand ? #imageLiteral(resourceName: "expand-close"): #imageLiteral(resourceName: "expand-open")
        
        
    }
        
}
  
    

