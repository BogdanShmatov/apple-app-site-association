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
    
    var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 327, height: 60)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        return collectionView
    }()
    
    var categories = [Category]()
    var sortedCategories = [Category]()
    
    var qrButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0.11, green: 0.514, blue: 1, alpha: 1)
        button.layer.cornerRadius = 20
        button.setImage(UIImage(named: "qr"), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    var paymentLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        return label
    }()
    
    var paymentsLabel: UILabel = {
        let label = UILabel()
        label.text = "Платежи"
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    var paymentsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0.11, green: 0.514, blue: 1, alpha: 1)
        button.layer.cornerRadius = 25
        button.setTitle("Платежи", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.tintColor = .white
        
        return button
    }()
    
    var searchField: UITextField = {
        let field = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: field.frame.height))
        field.leftView = paddingView
        field.leftViewMode = UITextField.ViewMode.always
        
        field.placeholder = "Поиск по кошельку..."
        field.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        field.textColor = UIColor(red: 0.688, green: 0.688, blue: 0.688, alpha: 1)
        field.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)
        field.layer.cornerRadius = 12
        
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupView()
        
    }
    
    private func configure() {
        presenter?.output = self
        presenter?.getCategories()
        
        searchField.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
    
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

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
//        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredVertically)
        let authViewController = AuthViewController()
        navigationController?.pushViewController(authViewController, animated: true)
    }
}

extension CategoriesViewController: MainPresenterpOutput, UITextFieldDelegate {
    
    func onSuccessCategories(data: [Category]) {
        categories = data
        sortedCategories = categories
        self.categoryCollectionView.reloadData()
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
