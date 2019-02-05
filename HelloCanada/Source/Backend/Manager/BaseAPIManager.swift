//
//  BaseAPIManager.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import Alamofire

enum APIError: Error {

    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure

    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        }

    }

}

protocol BaseAPIManager {

    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (APIResponse<T, APIError>) -> Void)
}

extension BaseAPIManager {

    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (APIResponse<T, APIError>) -> Void) {
        // Send Request
        Alamofire.request(request.url!, parameters: [String: Any](), encoding: JSONEncoding.default).validate().responseData { response in
            // Validate Response
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        if isCompatableWithUtf8(data) {
                            let genericModel = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(genericModel))
                        } else {
                            if let updatedData = convertDataToUtf8Compatable(data) {
                                let genericModel = try JSONDecoder().decode(T.self, from: updatedData)
                                completion(.success(genericModel))
                            }
                        }
                    }
                    catch {
                        completion(APIResponse.failiure(APIError.jsonParsingFailure))
                    }

                } else {
                    completion(APIResponse.failiure(APIError.jsonConversionFailure))
                }

            case .failure:
                completion(APIResponse.failiure(APIError.requestFailed))
                return
            }
        }
    }
}




func isCompatableWithUtf8(_ data: Data) -> Bool {
    if let _ = String(data: data, encoding: String.Encoding.utf8) {
        return true
    }
    return false
}



func convertDataToUtf8Compatable(_ data: Data) -> Data? {
    if let incoming = String(data: data, encoding: String.Encoding.ascii) {
        return incoming.data(using: .utf8)
    }
    return nil
}
