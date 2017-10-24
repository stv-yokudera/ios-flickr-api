//
//  PhotoSearchParamsBuilderTests.swift
//  ios-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import XCTest
@testable import ios_flickr_api

final class PhotoSearchParamsBuilderTests: XCTestCase {
    
    /// 写真検索APIのパラメータ生成処理のテスト
    func testBuildWithTagsAtPage() {
        let parameters = PhotoSearchParamsBuilder.build(tags: "Dog", page: 1) as! [String: String]
        XCTAssertEqual(parameters["page"], "1")
        XCTAssertEqual(parameters["per_page"], "50")
        XCTAssertEqual(parameters["tags"], "Dog")
    }
}
