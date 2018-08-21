//
//  APIRequestProvider.swift
//  imuzik
//
//  Created by Huy Nguyen on 1/4/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

/*
 *  APIRequestProvider takes responsible for build and provide request for service objects
 *  default header for request will be defined here
 */
class APIRequestProvider: NSObject {
    //mark: SINGLETON
    static var shareInstance: APIRequestProvider = {
        let instance = APIRequestProvider()
        return instance
    }()
    //mark: DEFAULT HEADER & REQUEST URL
    private var _headers: HTTPHeaders = [:]
    var headers: HTTPHeaders {
        set {
            _headers = headers
        }
        get {
            let authorizationCode = "example.networking"
            let headers: HTTPHeaders = [
                "authorization_code": authorizationCode
            ]
            return headers
        }
    }

    private var _requestURL: String = ""
    var requestURL: String {
        set {
            _requestURL = requestURL
        }
        get {
            if let path = Bundle.main.infoDictionary?["APP_SERVICE_ENDPOINT_URL"] as? String {
                _requestURL = path
            }
            return _requestURL
        }
    }

    var alamoFireManager: SessionManager
    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 120
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        alamoFireManager = Alamofire.SessionManager(configuration: configuration)
    }

    //mark: -- Authorization Requests
    func getSearchResult(_ term: String) -> DataRequest {
        let urlSrting = requestURL.appending("search")
        var param = [String: String]()
        param["media"] = "music"
        param["entity"] = "song"
        param["term"] = term
        return alamoFireManager.request(urlSrting,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.default,
                                        headers: nil)
    }
}
