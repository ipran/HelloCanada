//
//  UIImageView.swift
//  HelloCanada
//
//  Created by Pranil on 2/4/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView{
    /*
     Load Images Asynchronusly - Support Assessment Controller Views
     Activity indicator color did set on UIImageView+WebCache - line number 177
     */
    func loadImageFrom(_ url: URL) {
        self.setShowActivityIndicator(true)
        self.setIndicatorStyle(.whiteLarge)
        self.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "loading"), options: SDWebImageOptions.refreshCached, completed: { (image, error, cacheType, url) in
            if let _ =  error {
                self.image = #imageLiteral(resourceName: "no_image")
            }
        })
    }
}
