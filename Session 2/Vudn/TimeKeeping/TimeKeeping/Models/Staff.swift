//
//  Staff.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/17/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import Foundation
import RealmSwift

class Staff: Person {
    @objc dynamic var id = 0
    @objc dynamic var type = 0
    @objc dynamic var avatar = ""
    @objc dynamic var status = false
    @objc dynamic var department: Derpartment?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(name: String, type: Int, avatar: String,
                     status: Bool, department: Derpartment, birthDay: Double,
                     phone: String, address: String, gender: Int) {
        self.init()
        self.id = 0
        self.name = name
        self.type = type
        self.avatar = avatar
        self.status = status
        self.department = department
        self.birthday = birthday
        self.phone = phone
        self.address = address
        self.gender = gender
    }
}
