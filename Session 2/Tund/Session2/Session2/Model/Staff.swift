//
//  Staff.swift
//  Session2
//
//  Created by admin on 8/17/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import RealmSwift

public class Staff: Object {
    @objc dynamic var userID: String = ""
    @objc dynamic var avatar: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var position: String = ""
    @objc dynamic var status: String = ""
    override public static func primaryKey() -> String? {
        return "userID"
    }
}
