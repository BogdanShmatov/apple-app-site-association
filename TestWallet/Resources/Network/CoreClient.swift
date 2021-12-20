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
    
    typealias CoreResponse = ([Service]?, Error?) -> Void
    
    func services(_ success: @escaping CoreResponse) {
        
        let request = AF.request(Urls.base + "/service", method: .get)
        
            request.responseDecodable(of: [Service].self) { response in
                
                if let response = response.value  {
                    success(response, nil)
                }
        }
    }
}
