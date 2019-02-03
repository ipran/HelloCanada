//
//  URLRequest.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case head = "HEAD"
}

extension URLRequest {
    var method: HTTPMethod? {
        get {
            guard let httpMethod = self.httpMethod else {
                return nil
            }
            let method = HTTPMethod(rawValue: httpMethod)
            return method
        }
        set {
            self.httpMethod = newValue?.rawValue
        }
    }
}
