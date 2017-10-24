//
//  String+Localized.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import Foundation

extension String {
    
    static func localized(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
