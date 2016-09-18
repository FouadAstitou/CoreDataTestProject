//
//  NewsItem+CoreDataProperties.swift
//  OrbitNews
//
//  Created by Supervisor on 18-09-16.
//  Copyright © 2016 Nerdvana. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension NewsItem {

    @NSManaged var id: NSNumber
    @NSManaged var title: String
    @NSManaged var text: String
    @NSManaged var date: String
    @NSManaged var url: String

}
