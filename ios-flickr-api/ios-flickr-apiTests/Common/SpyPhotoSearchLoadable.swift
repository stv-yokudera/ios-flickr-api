//
//  SpyPhotoSearchLoadable.swift
//  ios-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import XCTest
@testable import ios_flickr_api

final class SpyPhotoSearchLoadable: PhotoSearchLoadable {
    
    var status: PhotoListStatus?
    var asyncExpectation: XCTestExpectation?
    
    func set(status: PhotoListStatus) {
        
        guard let expectation = asyncExpectation else {
            XCTFail("Delegateが正しく設定されていない")
            return
        }
        
        self.status = status
        expectation.fulfill()
    }
}
