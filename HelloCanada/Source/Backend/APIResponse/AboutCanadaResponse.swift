//
//  AboutCanadaResponse.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

struct AboutCanadaResponse: Decodable {
    let title : String?
    let rows: [AboutCanada]?
}
