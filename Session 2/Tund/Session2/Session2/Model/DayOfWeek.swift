//
//  DayOfWeek.swift
//  Session2
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class DayOfWeek: NSObject {
    var weekday: String
    var day: String
    var checkIn: String
    var checkOut: String
    var workday: String
    var status: String
    
    init(weekday: String, day: String, checkIn: String, checkOut: String, workday: String, status: String) {
        self.weekday = weekday
        self.day = day
        self.checkIn = checkIn
        self.checkOut = checkOut
        self.workday = workday
        self.status = status
    }

}
