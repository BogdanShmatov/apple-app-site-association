//
//  MainPresenter.swift
//  TestWallet
//
//  Created by Bogdan on 05.12.2021.
//

import Foundation

protocol MainPresenterInput {
    func getCategories()
}

protocol MainPresenterpOutput: AnyObject {
    func onSuccessCategories(data: [Category])
}

final class MainPresenter {
    
    fileprivate let requestManager = CoreClient()
    fileprivate let coreData = CoreDataHandler()
    
    weak var output: MainPresenterpOutput?
}

extension MainPresenter: MainPresenterInput {
    
    func getCategories() {
        requestManager.services() { (response, error) in
            if let response = response  {
                self.output?.onSuccessCategories(data: response)
            }
        }
    }
}
