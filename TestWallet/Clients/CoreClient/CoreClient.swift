//
//  CoreClient.swift
//  TestWallet
//
//  Created by Bogdan on 05.12.2021.
//

import Foundation
import Alamofire

class CoreClient {
    public func send(_ url: URLConvertible,
                     method: HTTPMethod = .get,
                     parameters: [String: String]? = nil,
                     encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default,
                     headers: HTTPHeaders? = nil) {
        
            AF.request(
            url,
            method: method,
            parameters: parameters,
            encoder: encoder,
            headers: headers)
            .responseJSON { response in
//                print("Request: \(response.request)")
//                print("Response: \(response.response)")
//                print("Data: \(response.data)")
//                print("Result: \(response.result)")
            }
    }
}
