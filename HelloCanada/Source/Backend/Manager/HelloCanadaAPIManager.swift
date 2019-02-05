//
//  HelloCanadaAPIManager.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

class HelloCanadaAPIManager: BaseAPIManager {
    /**
     Fetch About Canada data
     */
    func fetchAboutCanadaDetails(completion: @escaping (APIResponse<AboutCanadaResponse?, APIError>) -> Void) {

        let endpoint = AboutCanadaFeed.aboutCanada
        var request = endpoint.request
        request.method = HTTPMethod.get
        
        fetch(with: request, decode: { json -> AboutCanadaResponse? in
            guard let aboutCanadaFeedResult = json as? AboutCanadaResponse else { return  nil }
            return aboutCanadaFeedResult
        }, completion: completion)
    }
}
