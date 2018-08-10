//
//  TimeKeeping.swift
//  Session2
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TimeKeeping: NSObject {
    var isExpand: Bool
    var week: String
    var day: String
    var dayOfWeek: [DayOfWeek]
    
    
    init(isExpand: Bool, week: String, day: String, dayOfWeek: [DayOfWeek]) {
        self.week = week
        self.day = day
        self.isExpand = isExpand
        self.dayOfWeek = dayOfWeek
    }

}
