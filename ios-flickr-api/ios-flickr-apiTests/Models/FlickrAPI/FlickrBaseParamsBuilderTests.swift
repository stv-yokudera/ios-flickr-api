//
//  FlickrBaseParamsBuilderTests.swift
//  ios-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import XCTest
@testable import ios_flickr_api

final class FlickrBaseParamsBuilderTests: XCTestCase {
    
    /// Flickr APIの基底パラメータ生成処理のテスト
    func testBuild() {
        let parameters = FlickrBaseParamsBuilder.build() as! [String: String]
        XCTAssertEqual(parameters["method"], "flickr.photos.search")
        XCTAssertEqual(parameters["api_key"], "92f3fd8101d1d3a3613339d37c0452b9")
        XCTAssertEqual(parameters["nojsoncallback"], "1")
        XCTAssertEqual(parameters["format"], "json")
    }
}
