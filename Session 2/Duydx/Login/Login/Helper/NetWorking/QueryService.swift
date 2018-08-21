//
//  QueryService.swift
//  Login
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
class QuerySerive {
//    typealias QueryResult = (String, String) -> ()
    let defautlSesson = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var person: [Person] = []
    var errorMessage = ""
    var data: String = ""
    func getDataResult(completion: @escaping (String, String) -> Void ) {
        dataTask?.cancel()
        if var urlComponent = URLComponents(string: "https://vnexpress.net/rss/tin-moi-nhat.rss") {
            guard let url = urlComponent.url else {
                return
            }
            dataTask = defautlSesson.dataTask(with: url) { data, respone, error in
                defer {self.dataTask = nil}
                if let error = error {
                    print("\(error)")
                } else if let data = data,
                    let respone = respone as? HTTPURLResponse,
                    respone.statusCode == 200 {
                    print(data)
                    self.data = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
                    DispatchQueue.main.async {
                        completion(self.data, self.errorMessage)
                    }
                }
            }
        }
        dataTask?.resume()
    }
}
