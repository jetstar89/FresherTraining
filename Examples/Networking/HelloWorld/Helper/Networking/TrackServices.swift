//
//  TrackServices.swift
//  HelloWorld
//
//  Created by hnc on 8/20/18.
//  Copyright © 2018 hnc. All rights reserved.
//

import Foundation
import Alamofire

class TrackServices: APIServiceObject {
    func getSearchResults(_ term: String, completion:@escaping (Result<[Track]>) -> Void) {
        let request = APIRequestProvider.shareInstance.getSearchResult(term)
        serviceAgent.startRequest(request) { (json, error) in
            if let error = error {
                completion(Result.failure(error))
            } else {
                var tracks = [Track]()
                for item in json["results"].arrayValue {
                    tracks.append(Track(item))
                }
                completion(Result.success(tracks))
            }
        }
    }
}
