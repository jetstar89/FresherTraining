//
//  DayTableViewCell.swift
//  Session2
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class DayTableViewCell: UITableViewCell {
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var waitButton: UIButton!
    @IBOutlet weak var weekDayView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var workDayLabel: UILabel!
    @IBOutlet weak var checkOutLabel: UILabel!
    @IBOutlet weak var checkInLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func customInit(weekDay: String,
                    status: String,
                    checkIn: String,
                    checkOut: String,
                    workDay: String,
                    day: String ,
                    section: Int) {
        self.weekDayLabel.text = weekDay
        self.statusLabel.text = status
        self.workDayLabel.text = workDay
        self.checkInLabel.text = checkIn
        self.checkOutLabel.text = checkOut
        self.dayLabel.text = day
        self.weekDayView.layer.borderWidth = CGFloat(1.0)
        if checkOut.isEqual("Quên chấm công") {
            self.checkOutLabel.backgroundColor = UIColor(red: 207/255, green: 2/255, blue: 27/255, alpha: 1)
            self.checkOutLabel.textColor = UIColor.white
            self.checkOutLabel.font = self.checkOutLabel.font.withSize(12)
        } else {
            self.checkOutLabel.backgroundColor = UIColor.white
            self.checkOutLabel.textColor = UIColor.black
            self.checkOutLabel.font = self.checkOutLabel.font.withSize(16)
        }
        if checkOut.isEqual("08:00 SA") {
            self.checkOutLabel.textColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
            self.waitButton.isHidden = false
        } else {
            self.checkOutLabel.textColor = UIColor.black
            self.waitButton.isHidden = true
        }
        if checkOut.isEqual("12:00 SA") {
            self.statusLabel.isHidden = true
            self.warningLabel.isHidden = false
            self.requestButton.isHidden = false
        } else {
            self.statusLabel.isHidden = false
            self.warningLabel.isHidden = true
            self.requestButton.isHidden = true
        }
        if weekDay.isEqual("T7") || weekDay.isEqual("CN") {
            self.weekDayView.layer.borderColor = UIColor(red: 242/255, green: 81/255, blue: 95/255, alpha: 1).cgColor
            self.weekDayLabel.textColor = UIColor(red: 242/255, green: 81/255, blue: 95/255, alpha: 1)
            self.dayLabel.backgroundColor = UIColor(red: 242/255, green: 81/255, blue: 95/255, alpha: 1)
        } else {
            self.weekDayView.layer.borderColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1).cgColor
            self.weekDayLabel.textColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
            self.dayLabel.backgroundColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
        }
    }
}
