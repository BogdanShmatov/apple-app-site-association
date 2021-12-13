//
//  ServiceCollectionViewCell.swift
//  TestWallet
//
//  Created by Bogdan on 13.12.2021.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var servicesTableView: UITableView!
    
//    private var services = [Service]()
    
    var services = [Service]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.servicesTableView.dataSource = self
        self.servicesTableView.delegate = self
        self.servicesTableView.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        // Initialization code
    }
    
    func setupCell(services: [Service]) {
        self.services = services
        self.servicesTableView.reloadData()
    }

}
extension ServiceCollectionViewCell:UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell") as! ServiceTableViewCell
        cell.setupCell(service: self.services[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
