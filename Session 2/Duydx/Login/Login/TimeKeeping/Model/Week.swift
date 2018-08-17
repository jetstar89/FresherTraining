//
//  Week.swift
//  Login
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class Week: NSObject {
    var isEpand: Bool
    var weekNumber: String
    var totalDay: String
    init(_ isEpand: Bool, _ weekNumber: String, _ totalDay: String) {
        self.isEpand = isEpand
        self.weekNumber = weekNumber
        self.totalDay = totalDay
    }
}
