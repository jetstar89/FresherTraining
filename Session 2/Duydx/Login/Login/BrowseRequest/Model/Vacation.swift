//
//  Vacation.swift
//  Login
//
//  Created by admin on 8/14/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class Vacation: NSObject {
    var title: String
    var timeVacation: String
    var namePerson: String
    var timeRequest: String
    var status: String
    var note: String
    init(_ title: String, _ timeVacation: String, _ namePerson: String, _ timeRequest: String,_ status: String, _ note: String){
        self.title = title
        self.timeVacation = timeVacation
        self.namePerson = namePerson
        self.timeRequest = timeRequest
        self.status = status
        self.note = note
    }
}
