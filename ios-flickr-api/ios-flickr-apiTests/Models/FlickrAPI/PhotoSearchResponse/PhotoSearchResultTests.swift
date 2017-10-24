//
//  PhotoSearchResultTests.swift
//  ios-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import ios_flickr_api

final class PhotoSearchResultTests: XCTestCase {
    
    func testMapping() {
        let dummy = DummyResponse().photoSearchApiJSONString()
        
        guard let photoSearchResult = Mapper<PhotoSearchResult>().map(JSONString: dummy) else {
            XCTFail("Mapping failure.")
            return
        }
        
        XCTAssertEqual(photoSearchResult.stat, "ok")
        
        guard let photos = photoSearchResult.photos else {
            XCTFail("photos is nil.")
            return
        }
        
        XCTAssertEqual(photos.page, 1)
        XCTAssertEqual(photos.pages, 3409)
        XCTAssertEqual(photos.perpage, 50)
        XCTAssertEqual(photos.photo.count, 50)
        
        guard let photo = photos.photo.first else {
            XCTFail("photo is nil.")
            return
        }
        XCTAssertEqual(photo.farm, 5)
        XCTAssertEqual(photo.server, "4453")
        XCTAssertEqual(photo.id, "37111227204")
        XCTAssertEqual(photo.secret, "eef48af510")
        
    }
}
