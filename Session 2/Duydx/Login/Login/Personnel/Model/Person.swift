//
//  Person.swift
//  Login
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import RealmSwift
class Person: Object {
    @objc dynamic var namePerson: String = ""
    @objc dynamic var idPerson: String = ""
    @objc dynamic var phonePerson: String = ""
    @objc dynamic var positionPerson: String = ""
    @objc dynamic var isStatus: Bool = false
    @objc dynamic var imagePerson: String = ""
    override static func primaryKey() -> String? {
        return "idPerson"
    }
//    init(_ name: String, _ idPerson: String, _ phone: String, _ position: String, _ isStatus: Bool, _ image: String) {
//        self.namePerson = name
//        self.idPerson = idPerson
//        self.phonePerson = phone
//        self.positionPerson = position
//        self.isStatus = isStatus
//        self.imagePerson = image
//    }
}
