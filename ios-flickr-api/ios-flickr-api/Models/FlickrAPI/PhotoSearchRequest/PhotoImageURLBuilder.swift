//
//  PhotoImageURLBuilder.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/15.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import Foundation

final class PhotoImageURLBuilder {
    
    static func build(with photo: Photo) -> String {
        return "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
    }
}
