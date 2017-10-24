//
//  PhotoSearchParamsBuilder.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/15.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import Foundation

final class PhotoSearchParamsBuilder {
    
    static let perPage = 50
    
    static func build(tags: String,
                      page: Int) -> [String: Any] {
        
        var params = FlickrBaseParamsBuilder.build()
        params["page"] = "\(page)"
        params["per_page"] = "\(perPage)"
        params["tags"] = tags
        return params
    }

}
