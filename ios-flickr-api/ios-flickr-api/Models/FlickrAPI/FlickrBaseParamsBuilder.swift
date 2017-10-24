//
//  FlickrBaseParamsBuilder.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/15.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import Foundation

final class FlickrBaseParamsBuilder {
    
    static func build() -> [String: Any] {
        let params = ["method" : "flickr.photos.search",
                      "api_key" : "92f3fd8101d1d3a3613339d37c0452b9",
                      "nojsoncallback" : "1",
                      "format": "json"]
        return params
    }
}
