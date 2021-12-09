//
//  MainPresenter.swift
//  TestWallet
//
//  Created by Bogdan on 05.12.2021.
//

import Foundation

protocol MainPresenterInput {
    func auth(login: String, password: String)
    func getUserName() -> String
}

protocol MainPresenterpOutput: AnyObject {
    func onSuccessLogin()
}

final class MainPresenter {
    
    fileprivate let requestManager = CoreClient()
    
    weak var output: MainPresenterpOutput?
}

extension MainPresenter: MainPresenterInput {
    
    func getUserName() -> String {
        return "Bogdan"
    }
    
    func auth(login: String, password: String) {
       
        requestManager.auth(login: login,
                            password: password,
                            success: { (result: Auth) in
            self.output?.onSuccessLogin()
        }, error: nil)
    }
}

struct Auth: Decodable {
    let user: String
}
