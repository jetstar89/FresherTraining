//
//  APIServiceObject.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/21/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import Foundation
import Alamofire

class APIServiceObject: NSObject {
    var requests = [DataRequest]()
    let serviceAgent = APIServiceAgent()
    
    func addToQueue(_ request: DataRequest) {
        requests.append(request)
    }
    
    func cancelAllRequest() {
        
    }
}
