//
//  CategoriesViewController.swift
//  TestWallet
//
//  Created by Bogdan on 11.01.2022.
//

import UIKit
import SnapKit

class CategoriesViewController: UIViewController {

    private var presenter: MainPresenter? = MainPresenter()
    
    var categoryCollectionView: UICollectionView!
    var categories = [Category]()
    var sortedCategories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        presenter?.output = self
        presenter?.getCategories()
        
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        let qrButton = UIButton(type: .system)
        qrButton.backgroundColor = UIColor(red: 0.11, green: 0.514, blue: 1, alpha: 1)
        qrButton.layer.cornerRadius = 20
        qrButton.setImage(UIImage(named: "qr"), for: .normal)
        qrButton.tintColor = .white
  
        let paymentLabel = UILabel()
        paymentLabel.text = "Оплата"
        paymentLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        paymentLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        let paymentsLabel = UILabel()
        paymentsLabel.text = "Платежи"
        paymentsLabel.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        paymentsLabel.font = UIFont.systemFont(ofSize: 16)
        
        let paymentsButton = UIButton(type: .system)
        paymentsButton.backgroundColor = UIColor(red: 0.11, green: 0.514, blue: 1, alpha: 1)
        paymentsButton.layer.cornerRadius = 25
        paymentsButton.setTitle("Платежи", for: .normal)
        paymentsButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        paymentsButton.tintColor = .white
        
        
        let searchField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: searchField.frame.height))
        searchField.leftView = paddingView
        searchField.leftViewMode = UITextField.ViewMode.always
        
        searchField.placeholder = "Поиск по кошельку..."
        searchField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        searchField.textColor = UIColor(red: 0.688, green: 0.688, blue: 0.688, alpha: 1)
        searchField.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)
        searchField.layer.cornerRadius = 12
        searchField.delegate = self
        
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 327, height: 60)
        
        
        categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
       
        
        view.addSubview(qrButton)
        qrButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(34)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        view.addSubview(paymentLabel)
        paymentLabel.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(72)
        }
        
        view.addSubview(paymentsLabel)
        paymentsLabel.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(24)
            make.top.equalTo(paymentLabel).inset(44)
        }
        
        view.addSubview(paymentsButton)
        paymentsButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(paymentsLabel).inset(34)
            make.height.equalTo(48)
            make.width.equalTo(122)
        }
        
        view.addSubview(searchField)
        searchField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(paymentsButton).inset(70)
            make.height.equalTo(48)
            make.width.equalTo(328)
        }
        
        view.addSubview(categoryCollectionView)
        categoryCollectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(searchField).inset(70)
            make.width.equalTo(327)
            make.height.equalTo(550)
        }
    }
}

extension CategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.setupCell(sortedCategories[indexPath.row ])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredVertically)
    }
}

extension CategoriesViewController: MainPresenterpOutput, UITextFieldDelegate {
    
    func onSuccessCategories(data: [Category]) {
        categories = data
        sortedCategories = categories
        self.categoryCollectionView?.reloadData()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text, text != "" {
            sortedCategories = categories.filter {
                $0.title.contains(text)
            }
        } else {
            sortedCategories = categories
        }
        categoryCollectionView.reloadData()
        
        return true
    }
}
