//
//  Person.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/17/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import Foundation
import RealmSwift

enum Gender: Int {
    case male = 0
    case female
    case third
}

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var birthday: Double = 0
    @objc dynamic var phone = ""
    @objc dynamic var address = ""
    @objc dynamic var gender = Gender.male.rawValue
}
