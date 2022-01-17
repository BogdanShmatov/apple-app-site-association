//
//  AuthViewController.swift
//  TestWallet
//
//  Created by Bogdan on 28.12.2021.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func showMainViewController(_ sender: Any) {
        let mainViewController = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = mainViewController.instantiateViewController(identifier: "ViewController")
        secondVC.modalPresentationStyle = .fullScreen

        present(secondVC, animated: true, completion: nil)
    }
    @IBAction func closeController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func sohwNewController(_ sender: Any) {
        let main = CategoriesViewController()
        
        navigationController?.pushViewController(main, animated: true)
    }
}
