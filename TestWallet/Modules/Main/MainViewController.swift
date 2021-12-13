//
//  ViewController.swift
//  TestWallet
//
//  Created by Bogdan on 05.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var servicesCollectionView: UICollectionView!
    private var presenter: MainPresenter? = MainPresenter()
    
    var services = [
    Service(id: 1, name: "Service 1", title: "Title Service 1!", picture_url: "www.pic.cpm"),
    Service(id: 2, name: "Service 2", title: "Title Service 2!", picture_url: "www.pic2.cpm"),
    ]
    
//    lazy var label: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 24)
//        return label
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        self.servicesCollectionView.register(UINib(nibName: "ServiceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ServiceCollectionViewCell")
        self.servicesCollectionView.dataSource = self
        self.servicesCollectionView.delegate = self
    }
    
    func configure() {
        
        presenter?.output = self
        
//        label.text = presenter?.getUserName()
        
    }

    
    @IBAction func touchButtonGetServises(_ sender: Any) {
        print("Btn Pay")
        presenter?.services()
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
    
    func onSuccessService(data: Service) {
        print(data)
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionViewCell", for: indexPath) as! ServiceCollectionViewCell
        
        cell.setupCell(services: services)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
}
