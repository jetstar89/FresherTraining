//
//  Department.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/17/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import Foundation
import RealmSwift

enum DepartmentID: Int {
    case iOs = 1
    case Android
    case HR
    case QA
}

public class Derpartment: Object {
    @objc dynamic var name = ""
    @objc dynamic var id = DepartmentID.iOs.rawValue
    let staffs = List<Staff>()
}
