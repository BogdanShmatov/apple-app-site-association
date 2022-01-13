//
//  CategoryCollectionViewCell.swift
//  TestWallet
//
//  Created by Bogdan on 13.12.2021.
//

import UIKit
import SnapKit
//
//class CategoryCollectionViewCell: UICollectionViewCell {
//    
//    @IBOutlet weak var serviceImage: UIImageView!
//    @IBOutlet weak var serviceTitle: UILabel!
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    func setupCell(_ category: Category) {
//        serviceTitle.text = category.title
//    }
//}

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var serviceTitle = UILabel()
    let image = UIImageView()

    func setupCell(_ category: Category) {
        image.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)
        image.layer.cornerRadius = 12
        
        serviceTitle.text = category.title
        serviceTitle.textColor = UIColor(red: 0.169, green: 0.176, blue: 0.2, alpha: 1)
        serviceTitle.font = UIFont.systemFont(ofSize: 16, weight: .regular)
                
        contentView.addSubview(image)
        image.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.leftMargin.topMargin.bottomMargin.equalTo(8)
        }
        
        contentView.addSubview(serviceTitle)
        serviceTitle.snp.makeConstraints { make in
            make.left.equalTo(70)
            make.top.bottom.equalTo(6)
        }
    }
}
