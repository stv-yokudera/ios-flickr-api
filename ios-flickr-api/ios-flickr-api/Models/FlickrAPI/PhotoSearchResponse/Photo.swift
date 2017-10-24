//
//  Photo.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/15.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import ObjectMapper

final class Photo: Mappable {
    
    var farm = 0
    var server = ""
    var id = ""
    var secret = ""
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        farm    <- map["farm"]
        server  <- map["server"]
        id      <- map["id"]
        secret  <- map["secret"]
    }
}
