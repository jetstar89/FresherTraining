//
//  APIRequestProvider.swift
//  Session2
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIRequestProvider: NSObject {
     private var requestURL: String = "https://jsonplaceholder.typicode.com/posts"
    // MARK: SINGLETON
    static var shareInstance: APIRequestProvider = {
        let instance = APIRequestProvider()
        return instance
    }()
    var alamoFireManager: SessionManager
    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 120
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        alamoFireManager = Alamofire.SessionManager(configuration: configuration)
    }
    // MARK: -- Authorization Requests
    func getDataResult(_ id: String) -> DataRequest {
        var param = [String: String]()
        param["id"] = id
        return alamoFireManager.request(requestURL,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.default,
                                        headers: nil)
//       return alamoFireManager.request(requestURL)
    }
}
