//
//  Person.swift
//  Login
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class Person: NSObject {
    var namePersion: String
    var idPersion: String
    var phonePerson: String
    var positionPerson: String
    var isStatus: Bool
    var imagePerson: String
    init(_ name: String, _ idPerson: String, _ phone: String, _ position: String, _ isStatus: Bool, _ image: String) {
        self.namePersion = name
        self.idPersion = idPerson
        self.phonePerson = phone
        self.positionPerson = position
        self.isStatus = isStatus
        self.imagePerson = image
    }
}
