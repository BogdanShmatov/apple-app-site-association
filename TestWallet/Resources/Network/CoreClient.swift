//
//  CoreClient.swift
//  TestWallet
//
//  Created by Bogdan on 05.12.2021.
//

import Alamofire

enum Urls {
    static let base = "https://api.yii2-stage.test.wooppay.com/v1"
}

final class CoreClient {
    
    typealias CoreResponse = ([[String: Any]]?, Error?) -> Void
    
    func auth<T>(login: String,
                 password: String,
                 success: ((T) -> ())? = nil,
                 error: Any?) where T: Decodable {
        
        let parametrs = [
            "login":login,
            "password":password
        ]
        let headers: HTTPHeaders = [
            "":""
        ]
        let request = AF.request(Urls.base + "/auth",
                                 method: .post,
                                 parameters: parametrs,
                                 headers: headers)
        
        request.responseDecodable { (response: AFDataResponse<T>) in
            
        }
    }
}

private extension CoreClient {
//
//    func send(
//        _ url: String,
//        method: HTTPMethod = .get,
//        parameters: [String: String]? = nil,
//        encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default,
//        headers: HTTPHeaders? = nil,
//        completion: @escaping CoreResponse) {
//
//         AF.request(
//            self.baseUrl + url,
//            method: method,
//            parameters: parameters,
//            encoder: encoder,
//            headers: headers).responseJSON { response in
//
//                 if let error = response.error {
//                     completion(nil, error)
//                 } else if let jsonArray = response.value as? [[String: Any]] {
//                     completion(jsonArray, nil)
//                 }
//         }
//    }
}
