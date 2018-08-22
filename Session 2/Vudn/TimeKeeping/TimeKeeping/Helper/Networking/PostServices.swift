//
//  PostServices.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/21/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PostServices: APIServiceObject {
    func getPosts(_ term: String, completion: @escaping (Result<[Post]>) -> Void) {
        let request = APIRequestProvider.sharedInstand.getSearchResult(term)
        serviceAgent.startRequest(request) { (json, error) in
            if let error = error {
                completion(Result.failure(error))
            } else {
                var posts = [Post]()
                for item in json.arrayValue {
                    posts.append(Post(item))
                }
                completion(Result.success(posts))
            }
        }
    }
    
//    enum Result<Value> {
//        case success(Value)
//        case fail(Error)
//    }
//
//    func getPosts(for userId: Int, completion: @escaping (Result<[Post]>) -> Void?) {
//        var urlComponent = URLComponents()
//        urlComponent.scheme = "https"
//        urlComponent.host = "jsonplaceholder.typicode.com"
//        urlComponent.path = "/posts"
//        urlComponent.queryItems = [URLQueryItem(name: "userId", value: "\(userId)")]
//        guard let url = urlComponent.url else {
//            fatalError("Could not create url from component")
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//        let task = session.dataTask(with: request) {
//            (responseData, response, responseError) in
//            DispatchQueue.main.async {
//                if let error = responseError {
//                    print("response Error")
//                    completion(Result.fail(error))
//                } else if let data = responseData {
//                    let decoder = JSONDecoder()
//                    do {
//                        let posts = try decoder.decode([Post].self, from: data)
//                        completion(Result.success(posts))
//                    } catch {
//                        print("decode error")
//                        completion(Result.fail(error))
//                    }
//                } else {
//                    completion(
//                        Result.fail(
//                            NSError(domain: "",
//                                    code: 404,
//                                    userInfo: [NSLocalizedDescriptionKey :
//                                        "Data was not retrieved from request"])
//                                as Error))
//                }
//            }
//        }
//        task.resume()
//    }
}
