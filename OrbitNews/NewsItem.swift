//
//  NewsItem.swift
//  OrbitNews
//
//  Created by Supervisor on 18-09-16.
//  Copyright © 2016 Nerdvana. All rights reserved.
//

import Foundation
import CoreData


class NewsItem: NSManagedObject {

    // Sets the initial values of for the properties for a news item.
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        id = 0
        date = ""
        title = ""
        text = ""
        url = ""
    }
}
