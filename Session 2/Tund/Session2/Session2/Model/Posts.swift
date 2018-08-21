//
//  Posts.swift
//  Session2
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import SwiftyJSON

class Posts {
    let userId: String
    let id: String
    let title: String
    let body: String
    
    init(userId: String, id: String, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
    init(_ json: JSON) {
        self.userId = json["userId"].stringValue
        self.id =  json["id"].stringValue
        self.title = json["title"].stringValue
        self.body = json["body"].stringValue
    }

}
