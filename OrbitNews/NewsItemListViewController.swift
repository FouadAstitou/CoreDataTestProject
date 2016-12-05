//
//  ViewController.swift
//  OrbitNews
//
//  Created by Supervisor on 18-09-16.
//  Copyright © 2016 Nerdvana. All rights reserved.
//

import UIKit

class NewsItemListViewController: UITableViewController {
    
    // MARK: - properties
    var dataSource: NewsItemListDataSource?
    let coreDataStack = CoreDataStack(modelName: "OrbitNews")

    // MARK: - view set up
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title in the navigation bar.
        self.title = "Orbit News"
        
        // Sets the data source for the tableview.
        self.tableView.dataSource = dataSource
        
        // Registers the cells for the tableview.
        self.dataSource?.registerCellsForTableView(tableView)
        
        // Calls the custom function.
        getDataFromAPI()
    }

    // MARK: - getDataFromAPI
    func getDataFromAPI() {
        OrbitNewsApi.getJsonData(inContext: self.coreDataStack.mainQueueContext) { newsItems in
            self.dataSource?.newsItems = newsItems
            self.tableView.reloadData()
        }
    }
    
    // Sets the height for the tableview cells.
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
}

