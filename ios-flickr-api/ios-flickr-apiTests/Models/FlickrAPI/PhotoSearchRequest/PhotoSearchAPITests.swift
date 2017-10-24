//
//  PhotoSearchAPITests.swift
//  ios-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import XCTest
@testable import ios_flickr_api

final class PhotoSearchAPITests: XCTestCase {
    
    let photoSearchApi = PhotoSearchAPI()
    let loadable = SpyPhotoSearchLoadable()
    
    override func setUp() {
        super.setUp()
        photoSearchApi.loadable = loadable
    }
    
    override func tearDown() {
        photoSearchApi.loadable = nil
        super.tearDown()
    }
    
    /// 「Dog」で検索したときのテスト
    func testLoadWithTagsDog() {
        
        let expectation = self.expectation(description: "データが1件以上返却されること")
        loadable.asyncExpectation = expectation
        
        photoSearchApi.load(tags: "Dog")
        
        waitForExpectations(timeout: 2.0) { error in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
            }
            
            if let status = self.loadable.status {
                
                switch status {
                case .loading:
                    XCTFail("読み込み中")
                case .normal(let result):
                    XCTAssertNotNil(result)
                    guard let photo = result.photos?.photo else {
                        XCTFail("photo is nil.")
                        return
                    }
                    XCTAssertTrue(photo.count > 0)
                case .noData:
                    XCTFail("データが0件")
                case .offline:
                    XCTFail("オフライン")
                case .error:
                    XCTFail("エラー")
                }
            }
        }
    }
}
