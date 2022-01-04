//
//  ViewController.swift
//  TestWallet
//
//  Created by Bogdan on 05.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    private var presenter: MainPresenter? = MainPresenter()
    
    var categories = [Category]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        
        presenter?.output = self
        presenter?.getCategories()
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: categoryCollectionView.frame.width, height: 60)
        
        categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
    }

    
    @IBAction func touchButtonGetServises(_ sender: Any) {
        let authViewController = AuthViewController()
        present(authViewController, animated: true, completion: nil)
        print("Btn Pay")
    }
}

// MARK: - MainPresenterpOutput
extension ViewController: MainPresenterpOutput {
    
    func onSuccessCategories(data: [Category]) {
        categories = data
        categoryCollectionView.reloadData()
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        let category = categories[indexPath.row]
        cell.setupCell(category)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredVertically)
    }
}
