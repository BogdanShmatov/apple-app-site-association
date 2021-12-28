//
//  ViewController.swift
//  TestWallet
//
//  Created by Bogdan on 05.12.2021.
//

import UIKit
import SkeletonView

class ViewController: UIViewController, SkeletonCollectionViewDataSource {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    private var presenter: MainPresenter? = MainPresenter()
    
    var services = [Service]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        categoryCollectionView.isSkeletonable = true
        categoryCollectionView.showAnimatedGradientSkeleton()
    }
    
    func configure() {
        
        presenter?.output = self
        presenter?.services()
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: categoryCollectionView.frame.width, height: 60)
        
        categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
    }

    
    @IBAction func touchButtonGetServises(_ sender: Any) {
//        let authViewController = AuthViewController()
//        present(authViewController, animated: true, completion: nil)
        print("Btn Pay")
    }
}

// MARK: - MainPresenterpOutput
extension ViewController: MainPresenterpOutput {
    
    func onSuccessService(data: [Service]) {
        services = data
        categoryCollectionView.stopSkeletonAnimation()
        view.hideSkeleton()
        categoryCollectionView.reloadData()
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        let service = services[indexPath.row]
        cell.setupCell(service: service)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredVertically)
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "CategoryCollectionViewCell"
    }
}
