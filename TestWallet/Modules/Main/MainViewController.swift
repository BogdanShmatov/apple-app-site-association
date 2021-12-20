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
    
//    var services = [
//    Service(id: 1, name: "Service 1", title: "Title Service 1!", picture_url: "www.pic.cpm"),
//    Service(id: 2, name: "Service 2", title: "Title Service 2!", picture_url: "www.pic2.cpm"),
//    ]
    
    var services = [Service]()
    
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
        presenter?.services()
        
        servicesCollectionView.register(UINib(nibName: "ServiceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ServiceCollectionViewCell")
        servicesCollectionView.dataSource = self
        servicesCollectionView.delegate = self
//        label.text = presenter?.getUserName()
        
    }

    
    @IBAction func touchButtonGetServises(_ sender: Any) {
        print("Btn Pay")
//        presenter?.services()
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
    
    func onSuccessService(data: [Service]) {
//        print(data)
        services = data
        servicesCollectionView.reloadData()

    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceTableViewCell", for: indexPath) as! ServiceCollectionViewCell
        cell.setupCell(services: services)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
