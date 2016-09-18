//
//  NewsItemListDataSource.swift
//  OrbitNews
//
//  Created by Supervisor on 18-09-16.
//  Copyright © 2016 Nerdvana. All rights reserved.
//

import UIKit

class NewsItemListDataSource: NSObject, UITableViewDataSource {
    
    private let cellIdentifier = "Cell"
    var newsItems = [NewsItem]()

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let newsItem = newsItems[indexPath.row]
        cell.textLabel?.text = newsItem.text
        
        return cell
    }
    
    func registerCellsForTableView(tableView: UITableView) {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}
