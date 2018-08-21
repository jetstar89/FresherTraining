//
//  AllDataServices.swift
//  Session2
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Alamofire

class AllDataServices: APIServiceObject {
        func getDataResults(completion:@escaping (Result<[Posts]>) -> Void) {
            let request = APIRequestProvider.shareInstance.getDataResult()
            serviceAgent.startRequest(request) { (json, error) in
                if let error = error {
                    completion(Result.failure(error))
                } else {
                    var posts = [Posts]()
                        for item in json.arrayValue {
                            posts.append(Posts(item))
                }
                    completion(Result.success(posts))
                }
            }
        }
}
