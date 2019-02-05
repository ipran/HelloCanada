//
//  Endpoint.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

protocol EndPoint {
    var base: String { get }
    var method: HTTPMethod {get}
}

extension EndPoint {
    var apiKey: String {
        return ""
    }

    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.query = apiKey
        return components
    }

    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}

enum AboutCanadaFeed {
    case aboutCanada
}

extension AboutCanadaFeed: EndPoint {
    var method: HTTPMethod {
        return .get
    }

    var base: String {
        return "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    }
}

