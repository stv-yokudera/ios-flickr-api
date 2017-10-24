//
//  Photos.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/15.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import ObjectMapper

final class Photos: Mappable {
    
    var page = 0
    var pages = 0
    var perpage = 0
    var photo = [Photo]()
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        page    <- map["page"]
        pages   <- map["pages"]
        perpage <- map["perpage"]
        photo   <- map["photo"]
    }
}
