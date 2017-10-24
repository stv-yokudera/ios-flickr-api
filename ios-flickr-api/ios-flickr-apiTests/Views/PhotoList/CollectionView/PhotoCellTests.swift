//
//  PhotoCellTests.swift
//  ios-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import XCTest
@testable import ios_flickr_api

final class PhotoCellTests: XCTestCase {
    
    let dataSource = FakeDataSource()
    var collectionView: UICollectionView!
    var cell: PhotoCell!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "PhotoListViewController", bundle: nil)
        guard let photoListViewController = storyboard.instantiateViewController(withIdentifier: "PhotoListViewController")
            as? PhotoListViewController else {
                XCTFail("PhotoListViewControllerのインスタンス生成失敗")
                return
        }
        
        photoListViewController.loadView()
        
        collectionView = photoListViewController.collectionView
        collectionView.dataSource = dataSource
        
        cell = collectionView?.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier,
                                                   for: IndexPath(row: 0, section: 0)) as! PhotoCell
    }
    
    func testDefaultItem() {
        XCTAssertNil(cell.imageView.image)
    }
    
    /// セルの高さのテスト
    func testCellHeight() {
        XCTAssertEqual(cell.frame.size.height, PhotoCell.cellSize().height)
    }
    
    /// セルの幅のテスト
    func testCellWidth() {
        XCTAssertEqual(cell.frame.size.width, PhotoCell.cellSize().width)
    }
}

extension PhotoCellTests {
    
    final class FakeDataSource: NSObject, UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView,
                            numberOfItemsInSection section: Int) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            return UICollectionViewCell()
        }
    }
}
