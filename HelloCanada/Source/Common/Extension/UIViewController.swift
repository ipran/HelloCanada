//
//  UIViewController.swift
//  HelloCanada
//
//  Created by Pranil on 2/5/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {
    // Support Activity indicator
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
    }

    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }
}

