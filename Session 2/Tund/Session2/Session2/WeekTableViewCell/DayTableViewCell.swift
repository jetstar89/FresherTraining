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
    func customInit(weekDay: String, status: String, checkIn: String, checkOut: String, workDay: String, day: String ,section: Int) {
        self.weekDayLabel.text = weekDay
        self.statusLabel.text = status
        self.workDayLabel.text = workDay
        self.checkInLabel.text = checkIn
        self.checkOutLabel.text = checkOut
        self.dayLabel.text = day
        
        
    }
    
}
