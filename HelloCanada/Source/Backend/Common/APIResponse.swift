//
//  APIResponse.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

enum APIResponse<T,U> where U: Error {
    case success(T)
    case failiure(U)
}
