//
//  CategoryModel.swift
//  TestWallet
//
//  Created by Bogdan on 04.01.2022.
//

import Foundation

struct CategoryModel: Decodable {
    let id: Int64
    let title: String
    
    static let coreData = CoreDataHandler()
    
    func store() {
        guard let category = CategoryModel.coreData.add(Category.self) else {return}
        category.id = Int64(id)
        category.title = title
        
        CategoryModel.coreData.save()
    }
}
