//
//  ViewController.swift
//  TestWallet
//
//  Created by Bogdan on 05.12.2021.
//

import UIKit

class ViewController: UIViewController {

    private var presenter: MainPresenter? = MainPresenter()
    
//    lazy var label: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 24)
//        return label
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        presenter?.output = self
        
//        label.text = presenter?.getUserName()
        
    }
    
//    func touchButtonAction(){
//        presenter?.auth(login: "", password: "")
//    }
}

// MARK: - MainPresenterpOutput
extension ViewController: MainPresenterpOutput {
    
    func onSuccessLogin() {
        // Make alert
    }
}
