//
//  APIServiceProvider.swift
//  Login
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class APIRequestProvider: NSObject {
    static let share = APIRequestProvider()
    var requestURL: String = "https://jsonplaceholder.typicode.com/posts"
    var alamoFireManager: SessionManager
    override init() {
        self.alamoFireManager = SessionManager.default
    }
    func getDataResult(_ postID: String) -> DataRequest {
        var param = [String: String]()
        param["userId"] = postID
        return alamoFireManager.request(requestURL,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.default,
                                        headers: nil)
    }
}
