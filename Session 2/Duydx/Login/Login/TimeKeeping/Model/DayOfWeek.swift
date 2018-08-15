//
//  DayOfWeek.swift
//  Login
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
    init(_ weekday: String, _ day: String, _ checkIn: String, _ checkOut: String, _ workday: String, _ status: String) {
        self.weekday = weekday
        self.day = day
        self.checkIn = checkIn
        self.checkOut = checkOut
        self.workday = workday
        self.status = status
    }
}
