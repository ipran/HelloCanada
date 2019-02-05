//
//  Utils.swift
//  HelloCanada
//
//  Created by Pranil on 2/5/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
import UIKit
import Toast_Swift


// Support Toast
var kToastStyle: ToastStyle = {

    var style = ToastStyle()
    style.messageColor = UIColor.black
    style.messageFont = UIFont.systemFont(ofSize: 16)
    style.backgroundColor = .white
    style.displayShadow = true
    style.shadowColor = #colorLiteral(red: 0.8745098039, green: 0.8941176471, blue: 0.8901960784, alpha: 1)
    style.shadowRadius = 4
    style.shadowOpacity = 0.5
    style.shadowOffset = CGSize(width: 1, height: 2)
    return style
}()

let kToastDurationShort = 1.0
let kToastDurationMiddle = 2.0
let kToastDurationLong = 6.0
let kToastPosition = ToastPosition.center

// Support NVActivityIndicator
var activityIndicator : NVActivityIndicatorView = {

    let indicatorSize: CGFloat = 50
    let x = (UIScreen.main.bounds.width * 0.5) - (indicatorSize * 0.5)
    let y = (UIScreen.main.bounds.height * 0.4) - (indicatorSize * 0.5)
    let frame = CGRect(x: x, y: y, width: indicatorSize, height: indicatorSize)
    let indicator = NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType.ballBeat, color: UIColor.black, padding: 0)
    return indicator
}()
