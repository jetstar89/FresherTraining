//
//  Employee.swift
//  HanhChinhNhanSu
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class Employee: NSObject {
    var name: String
    var idUser: String
    var cellPhone: String
    var position: String
    var status: String
    var avatar: UIImage
    init(idUser: String, name: String, cellPhone: String, position: String, status: String, avatar: UIImage) {
        self.id = id
        self.name = name
        self.cellPhone = cell_phone
        self.position = position
        self.avatar = avatar
        self.status = status
    }
}
