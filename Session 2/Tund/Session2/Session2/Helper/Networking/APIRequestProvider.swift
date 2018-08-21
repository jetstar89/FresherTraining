//
//  APIServiceProvider.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/21/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIRequestProvider: NSObject {
    
    // MARK: - SINGLETON
    static var sharedInstand: APIRequestProvider = {
        let instand = APIRequestProvider()
        return instand
    }()
    
    // MARK: - DEFUALT HEADER AND REQUEST URL
    
    
    // MARK: - INIT
    var alamoFireManager: SessionManager
    private override init() {
        alamoFireManager = SessionManager.default
    }
    
    // MARK: - AUTHORIZATION REQUEST
    
    func getSearchResult(_ term: String) -> DataRequest {
        let urlRequest = "https://jsonplaceholder.typicode.com/posts"
        var param = [String : String]()
        param["userId"] = term
        return alamoFireManager.request(urlRequest,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.default,
                                        headers: nil)
    }
}
