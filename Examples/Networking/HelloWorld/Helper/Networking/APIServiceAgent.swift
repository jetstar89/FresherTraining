//
//  APIServiceAgent.swift
//  imuzik
//
//  Created by Huy Nguyen on 1/4/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CFNetwork

/*
 *  APIServiceAgent takes responsible for 
 *  - Convert DataResponse<Any> to JSON object
 *  - Detect and handle application errors such as: token expired, version not support...
 */

class APIServiceAgent: NSObject {
    /*
     *  perform request
     *  param:
     *  - request: DataRequest
     *  - completion block (JSON, NSError?)
     */
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
                    break                
                }
        }
    }
}
