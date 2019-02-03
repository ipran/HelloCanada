//
//  UICollectionViewCell.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    // Get CollectionViewCell Identifier
    static var identifier: String {

        return String(describing: self).components(separatedBy: ".").last!
    }
}
