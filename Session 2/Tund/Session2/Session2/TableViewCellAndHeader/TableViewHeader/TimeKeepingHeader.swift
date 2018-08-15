//
//  TimeKeepingHeader.swift
//  Session2
//
//  Created by admin on 8/14/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
protocol TimeKeepingHeaderDelegate: class {
    func touchSelection (header: TimeKeepingHeader, section: Int)
}

class TimeKeepingHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var expandImageView: UIImageView!
    @IBOutlet weak var workDayLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    weak var delegate: TimeKeepingHeaderDelegate?
    var section: Int = 0
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView(_:))))
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView(_:))))
    }
    @objc func selectHeaderView(_ gesture: UITapGestureRecognizer) {
        guard let cell = gesture .view as? TimeKeepingHeader else {
            return
        }
        delegate?.touchSelection(header: cell, section: cell.section)
    }
    func customInit(week: String, day: String, section: Int, isOnExpand: Bool, delegate: TimeKeepingHeaderDelegate) {
        self.weekLabel.text = week
        self.dayLabel.text = day
        self.section = section
        self.delegate = delegate
        if isOnExpand == true {
            self.headerView.backgroundColor = UIColor.init(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
            self.weekLabel.textColor = UIColor.white
            self.dayLabel.textColor = UIColor.white
            self.workDayLabel.textColor = UIColor.white
            self.expandImageView.image = #imageLiteral(resourceName: "expand-close")
        } else {
            self.headerView.backgroundColor = UIColor.white
            self.weekLabel.textColor = UIColor.black
            self.dayLabel.textColor = UIColor.black
            self.workDayLabel.textColor = UIColor.black
            self.expandImageView.image = #imageLiteral(resourceName: "expand-open")
        }
    }
}
