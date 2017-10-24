//
//  PhotoSearchResult.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/15.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import ObjectMapper

final class PhotoSearchResult: Mappable {
    
    var stat = ""
    var photos: Photos?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        stat <- map["stat"]
        photos <- map["photos"]
    }
}
