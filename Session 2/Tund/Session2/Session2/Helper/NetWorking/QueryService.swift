
//
//  QueryService.swift
//  Session2
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
// Runs query data task, and stores results in array of Tracks
class QueryService {
    typealias JSONDictionary = [String: Any]
    typealias QueryResult = ([Posts]?, String) -> ()
    // first
    let defaultSession = URLSession(configuration: .default)
    // second
    var dataTask: URLSessionDataTask?
    var posts: [Posts] = []
    var errorMessage = ""
//    var data: String = ""
    func getDataResults(completion: @escaping QueryResult) {
        // first
        dataTask?.cancel()
        // second
        if var urlComponents = URLComponents(string: "https://jsonplaceholder.typicode.com/posts") {
        // third
        guard let url = urlComponents.url else { return }
            // fourth
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                // fifth
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    print(data)
                    self.updateSearchResults(data)
                    // 6
                    DispatchQueue.main.async {
                        completion(self.posts, self.errorMessage)
                    }
                }
            }
            // 7
            dataTask?.resume()
            }
        }
    // upload data to array tracks
    fileprivate func updateSearchResults(_ data: Data) {
        //
        var response: JSONDictionary?
        posts.removeAll()
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
        guard let array = response!["results"] as? [Any] else {
            errorMessage += "Dictionary does not contain results key\n"
            return
        }
        for trackDictionary in array {
            if let trackDictionary = trackDictionary as? JSONDictionary,
               let userId = trackDictionary["userId"] as? String,
               let id = trackDictionary["id"] as? String,
               let title = trackDictionary["title"] as? String,
               let body = trackDictionary["body"] as? String {
                posts.append(Posts(userId: userId, id: id, title: title, body: body))
            } else {
                errorMessage += "Problem parsing trackDictionary\n"
            }
                
        }
    }
}
