//
//  PhotoCell.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func cellSize() -> CGSize {
        let margin: CGFloat = 10
        let screenSize = UIScreen.main.bounds
        let screenPerWidth: CGFloat = 3
        let screenPerHeight: CGFloat = 5
        
        let cellWidth = (screenSize.width - margin) / screenPerWidth
        let cellHeight = (screenSize.height - margin) / screenPerHeight
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
