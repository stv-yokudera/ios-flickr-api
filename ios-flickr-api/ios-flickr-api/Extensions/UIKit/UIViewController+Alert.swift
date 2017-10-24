//
//  UIViewController+Alert.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showOkAlert(title: String = "",
                     message: String,
                     completionHandler: @escaping ((UIAlertAction) -> Void)) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: String.localized(key: "ALERT_OK"),
                                     style: .default,
                                     handler: completionHandler)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
