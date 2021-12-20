//
//  CategoryCollectionViewCell.swift
//  TestWallet
//
//  Created by Bogdan on 13.12.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(service: Service) {
        self.serviceTitle.text = service.title
    }
}
