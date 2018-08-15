//
//  Person.swift
//  Session2
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class Person: NSObject {
    var idUser: String
    var avatar: UIImage
    var name: String
    var phone: String
    var position: String
    var status: String
    init(idUser: String, avatar: UIImage, name: String, phone: String, position: String, status: String) {
         self.idUser = idUser
         self.avatar = avatar
         self.name = name
         self.phone = phone
         self.position = position
         self.status = status
    }

}
