//
//  MainPresenter.swift
//  TestWallet
//
//  Created by Bogdan on 05.12.2021.
//

import Foundation

protocol MainPresenterInput {
    func services()
}

protocol MainPresenterpOutput: AnyObject {
    func onSuccessService(data: [Service])
}

final class MainPresenter {
    
    fileprivate let requestManager = CoreClient()
    
    weak var output: MainPresenterpOutput?
}

extension MainPresenter: MainPresenterInput {
    
    func services() {
        requestManager.services() { (response, error) in
            if let response = response {
                self.output?.onSuccessService(data: response)
            }
        }
    }
}
