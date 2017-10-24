//
//  SVProgressHUD+MaskType.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/17.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import SVProgressHUD

extension SVProgressHUD {
    
    enum Custom {
        static func show(with status: String = "", maskType: SVProgressHUDMaskType = .black) {
            SVProgressHUD.setDefaultMaskType(maskType)
            SVProgressHUD.show(withStatus: status)
        }
    }
}
