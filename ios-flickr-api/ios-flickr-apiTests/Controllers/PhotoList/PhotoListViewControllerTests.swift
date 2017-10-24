//
//  PhotoListViewControllerTests.swift
//  ios-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import XCTest
@testable import ios_flickr_api

final class PhotoListViewControllerTests: XCTestCase {
    
    var photoListViewController: PhotoListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "PhotoListViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PhotoListViewController")
            as? PhotoListViewController else {
                XCTFail("PhotoListViewControllerのインスタンス生成失敗")
                return
        }
        photoListViewController = vc
        
        photoListViewController.loadView()
        photoListViewController.viewDidLoad()
    }
    
    /// CollectionViewのデータソースが設定されているかテスト
    func testCollectionViewDataSource() {
        XCTAssertNotNil(photoListViewController.collectionView.dataSource)
    }
    
    /// CollectionViewのデリゲートが設定されているかテスト
    func testCollectionViewDelegate() {
        XCTAssertNotNil(photoListViewController.collectionView.delegate);
    }
    
    /// ナビゲーションバータイトルのテスト
    func testNavigationTitle() {
        XCTAssertEqual(photoListViewController.navigationItem.title, "写真検索");
    }
}
