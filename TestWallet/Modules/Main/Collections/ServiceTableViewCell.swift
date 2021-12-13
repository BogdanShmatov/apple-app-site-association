//
//  ServiceTableViewCell.swift
//  TestWallet
//
//  Created by Bogdan on 13.12.2021.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var serviceImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    func setupCell(service: Service) {
        self.serviceTitle.text = service.title
    }
    
}
