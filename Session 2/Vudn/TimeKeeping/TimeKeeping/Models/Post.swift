//
//  Post.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/20/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    enum Result<Value> {
        case success(Value)
        case fail(Error)
    }
    
    func getPosts(for userId: Int, completion: @escaping (Result<[Post]>) -> Void?) {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "jsonplaceholder.typicode.com"
        urlComponent.path = "/posts"
        urlComponent.queryItems = [URLQueryItem(name: "userId", value: "\(userId)")]
        guard let url = urlComponent.url else {
            fatalError("Could not create url from component")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) {
            (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    completion(Result.fail(error))
                } else if let data = responseData {
                    let decoder = JSONDecoder()
                    do {
                        let posts = try decoder.decode(Post.self, from: data)
                        completion(Result.success([posts]))
                    } catch {
                        completion(Result.fail(error))
                    }
                } else {
                    completion(
                        Result.fail(
                            NSError(domain: "",
                                    code: 404,
                                    userInfo: [NSLocalizedDescriptionKey :
                                        "Data was not retrieved from request"])
                                as Error))
                }
            }
        }
        task.resume()
    }
}
