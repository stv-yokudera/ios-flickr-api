//
//  PhotoListProvider.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import UIKit
import Kingfisher

final class PhotoListProvider: NSObject {
    
    private var photos = [Photo]()
    
    func add(photos: [Photo]) {
        self.photos = photos
    }
    
    func append(photos: [Photo]) {
        photos.forEach {
            self.photos.append($0)
        }
    }
}

extension PhotoListProvider: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier,
                                                      for: indexPath) as! PhotoCell
        let imageUrlString = PhotoImageURLBuilder.build(with: self.photos[indexPath.row])
        let imageUrl = URL(string: imageUrlString)
        cell.imageView.kf.setImage(with: imageUrl)
        return cell
    }
}
