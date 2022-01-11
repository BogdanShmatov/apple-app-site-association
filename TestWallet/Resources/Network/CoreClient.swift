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
    
    typealias CoreResponse = ([Category]?, Error?) -> Void
    fileprivate let coreData = CoreDataHandler()
    
    func services(_ success: @escaping CoreResponse) {
        let categories = coreData.fetch(Category.self)
        if categories.count != 0 {
            success(categories, nil)
        }
        loadCategories(success)
    }
    
    private func loadCategories(_ success: @escaping CoreResponse) {
        let request = AF.request(Urls.base + "/service", method: .get)
            request.responseDecodable(of: [CategoryModel].self) { response in
                if let response = response.value  {
                    response.forEach{$0.store()}
                    let categories = self.coreData.fetch(Category.self)
                    success(categories, nil)
                }
        }
    }
}
