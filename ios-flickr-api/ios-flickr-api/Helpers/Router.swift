//
//  Router.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/15.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    /// ベースURL
    static let baseURLString = "https://api.flickr.com/services/rest"
    
    /// 検索API
    case photosSearchAPI([String: Any])
    
    func asURLRequest() throws -> URLRequest {
        
        let (method, path, parameters): (HTTPMethod, String, [String: Any]) = {
            
            switch self {
            case .photosSearchAPI(let params):
                return (.get, "", params)
            }
        }()
        
        if let url = URL(string: Router.baseURLString) {
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
        } else {
            fatalError("url is nil.")
        }
    }
}
