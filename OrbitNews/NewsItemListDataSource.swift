//
//  NewsItemListDataSource.swift
//  OrbitNews
//
//  Created by Supervisor on 18-09-16.
//  Copyright © 2016 Nerdvana. All rights reserved.
//

import UIKit
import CoreData

class NewsItemListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - properties
    private let cellIdentifier = "Cell"
    var newsItems = [NewsItem]()

    // MARK: - numberOfRowsInSection
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsItems.count
    }
    
    // MARK: - cellForRowAtIndexPath
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath) as! CustomNewsItemCell
        
        let newsItem = self.newsItems[indexPath.row]
        cell.titleLabel.text = newsItem.valueForKey("title") as? String
        cell.textView.text = newsItem.valueForKey("text") as? String
        cell.dateLabel.text = "Published: \(newsItem.valueForKey("date")!)"
        
        return cell
    }
    
    // Custom function which registers the class for the tableview cells.
    func registerCellsForTableView(tableView: UITableView) {
        tableView.registerClass(CustomNewsItemCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }
}
