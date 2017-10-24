//
//  PhotoImageURLBuilderTests.swift
//  ios-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import ios_flickr_api

final class PhotoImageURLBuilderTests: XCTestCase {
    
    /// 画像URL生成処理のテスト
    func testBuildWithPhoto() {
        let dummy = DummyResponse().photoSearchApiJSONString()
        
        guard let photoSearchResult = Mapper<PhotoSearchResult>().map(JSONString: dummy) else {
            XCTFail("Mapping failure.")
            return
        }
        guard let photo = photoSearchResult.photos?.photo.first else {
            XCTFail("photo is nil.")
            return
        }
        
        let imageUrlString = PhotoImageURLBuilder.build(with: photo)
        XCTAssertEqual(imageUrlString, "https://farm5.staticflickr.com/4453/37111227204_eef48af510.jpg")
    }
    
}
