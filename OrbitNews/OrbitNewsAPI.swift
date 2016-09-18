//
//  OrbitNewsAPI.swift
//  OrbitNews
//
//  Created by Supervisor on 18-09-16.
//  Copyright © 2016 Nerdvana. All rights reserved.
//

import UIKit
import CoreData

struct OrbitNewsApi {
    
    static func getJsonData(inContext context: NSManagedObjectContext, completionHandler: ([NewsItem]) -> ()) {
        
        var newsItems = [NewsItem]()
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let request = NSURLRequest(URL: NSURL(string: "https://testwerk.org/elvis/apps/assignment/articles.json")!)
        let task: NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in

            // If we receive the data we parse it
            if let data = data {
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                    
                    if let newsItemsFromResult = json as? [[String: AnyObject]] {
                        for newsItem in newsItemsFromResult {
                            guard let id = newsItem["id"] as? Int,
                            let date = newsItem["date"] as? String,
                            let title = newsItem["title"] as? String,
                            let text = newsItem["text"] as? String,
                            let URL = newsItem["link"] as? String
                                else {
                                    print("error serializing news item information")
                                    break
                            }
                            
                            // Using the context to insert new NewsItem instances, performBlockAndWait() for synchronous interaction with the queue that NSManagedObjectContext is associated with (main queue).
                            var newsItem: NewsItem!
                            context.performBlockAndWait() {
                                newsItem = NSEntityDescription.insertNewObjectForEntityForName("NewsItem", inManagedObjectContext: context) as! NewsItem
                                newsItem.id = id
                                newsItem.date = date
                                newsItem.title = title
                                newsItem.text = text
                                newsItem.url = URL
                            }
                            newsItems.append(newsItem)
                        }
                    }
                    dispatch_async(dispatch_get_main_queue(),{
                        completionHandler(newsItems)
                    })
                }
                catch {
                    print("error serializing JSON: \(error)")
                }
            }
        }
        
        task.resume()
    }
    
    static func saveTitle(newsItems: NewsItem) {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("NewsItem", inManagedObjectContext:managedContext)
        
        let newsItem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //3
        newsItem.setValue(newsItems.id, forKey: "id")
        newsItem.setValue(newsItems.date, forKey: "date")
        newsItem.setValue(newsItems.title, forKey: "title")
        newsItem.setValue(newsItems.text, forKey: "text")
        newsItem.setValue(newsItems.url, forKey: "url")
        
        //4
        do {
            try managedContext.save()
            //5
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}
