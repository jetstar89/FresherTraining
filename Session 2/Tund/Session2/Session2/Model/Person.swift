//
//  Person.swift
//  Session2
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import RealmSwift

public class Person: NSObject {
    @objc dynamic var idUser: String
    @objc dynamic var avatar: UIImage
    @objc dynamic var name: String
    @objc dynamic var phone: String
    @objc dynamic var position: String
    @objc dynamic var status: String
    init(idUser: String, avatar: UIImage, name: String, phone: String, position: String, status: String) {
         self.idUser = idUser
         self.avatar = avatar
         self.name = name
         self.phone = phone
         self.position = position
         self.status = status
    }
}
