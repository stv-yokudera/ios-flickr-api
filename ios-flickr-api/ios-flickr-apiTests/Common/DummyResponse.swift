//
//  DummyResponse.swift
//  ios-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import Foundation

final class DummyResponse: NSObject {
    /// 写真検索APIのダミーレスポンス
    func photoSearchApiJSONString() -> String {
        let testBundle = Bundle(for: type(of: self))
        let jsonPath = testBundle.path(forResource: "photos_search", ofType: "json")
        let fileHandle = FileHandle(forReadingAtPath: jsonPath!)
        
        return String(data: fileHandle!.readDataToEndOfFile(), encoding: .utf8)!
    }
}
