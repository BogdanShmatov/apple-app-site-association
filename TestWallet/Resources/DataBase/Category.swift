//
//  Category.swift
//  TestWallet
//
//  Created by Bogdan on 04.01.2022.
//

import Foundation
import CoreData

public class Category: NSManagedObject {
    @NSManaged var id: Int64
    @NSManaged var title: String
}
