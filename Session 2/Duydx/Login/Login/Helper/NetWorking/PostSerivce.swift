//
//  PersonSerivce.swift
//  Login
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Alamofire
class PostService: APIServiceObject {
    func getPersonResult(_ postID: String, completion: @escaping (Result<[Post]>) -> Void) {
        let request = APIRequestProvider.share.getDataResult(postID)
        serviceAgent.startRequest(request) { (json, error) in
            if let error = error {
                completion(Result.failure(error))
            } else {
                var post = [Post]()
                for item in json.arrayValue {
                    post.append(Post(item))
                }
                completion(Result.success(post))
            }
        }
    }
}
