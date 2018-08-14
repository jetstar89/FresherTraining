//
//  Vacation.swift
//  Session2
//
//  Created by admin on 8/14/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class Vacation: NSObject {
    var name: String
    var reason: String
    var timeDuration: String
    var timeBegin: String
    var resultNote: String
    var result: String
    
    init(name: String, reason: String, timeDuration: String, timeBegin: String, resultNote: String, result: String) {
        self.name = name
        self.reason = reason
        self.timeDuration = timeDuration
        self.timeBegin = timeBegin
        self.resultNote = resultNote
        self.result = result
    }
    

}
