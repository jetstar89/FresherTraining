//
//  Post.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/20/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import Foundation
import SwiftyJSON

class Post {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
    init(_ json: JSON) {
        self.userId = json["userId"].intValue
        self.id = json["id"].intValue
        self.title = json["title"].stringValue
        self.body = json["body"].stringValue
    }
}
