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
    let coreDataStack = CoreDataStack(modelName: "OrbitNews")


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
        OrbitNewsApi.getJsonData(inContext: self.coreDataStack.mainQueueContext) { (newsItems) in
            self.dataSource?.newsItems = newsItems
            do {
                try self.coreDataStack.saveChanges()
            }
            catch let error {
                print("Error saving changes: \(error)")
            }
            self.tableView.reloadData()
        }
    }
}

