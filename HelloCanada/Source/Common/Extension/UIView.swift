//
//  UIView.swift
//  HelloCanada
//
//  Created by Pranil on 2/5/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

extension UIView {
    // Show Toast
    func showToast(_ message: String, duration: Double = kToastDurationMiddle) {

        makeToast(message, duration: duration, position: kToastPosition, style: kToastStyle)
    }
}
