//
//  ViewController.swift
//  OrbitNews
//
//  Created by Supervisor on 18-09-16.
//  Copyright © 2016 Nerdvana. All rights reserved.
//

import UIKit

class NewsItemListViewController: UITableViewController {
    
    var dataSource: NewsItemListDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellowColor()
        
        tableView.dataSource = dataSource
        dataSource?.registerCellsForTableView(tableView)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140

       getDataFromAPI()
    }

    func getDataFromAPI() {
        OrbitNewsApi.getJsonData { (newsItems) in
            self.dataSource?.newsItems = newsItems
            self.tableView.reloadData()
        }
    }
}

