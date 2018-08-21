//
//  Post.swift
//  Login
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import SwiftyJSON
class Post: NSObject {
    var userId: Int
    var idPost: Int
    var title: String
    var body: String
    init(_ json: JSON) {
        self.idPost = json["id"].intValue
        self.userId = json["userId"].intValue
        self.title = json["title"].stringValue
        self.body = json["body"].stringValue
    }
}
