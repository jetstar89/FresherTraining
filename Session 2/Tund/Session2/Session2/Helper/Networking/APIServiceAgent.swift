//
//  APIServiceAgent.swift
//  Session2
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import CFNetwork
class APIServiceAgent: NSObject {
    func startRequest(_ request: DataRequest, completion: @escaping(JSON, NSError?) -> Void) {
        request
            .validate()
            .responseJSON { (_ response: DataResponse<Any>) in
                print(request.debugDescription)
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    completion(json, nil)
                case .failure(let error as NSError):
                    completion(JSON.null, error)
                }
        }
    }
}
