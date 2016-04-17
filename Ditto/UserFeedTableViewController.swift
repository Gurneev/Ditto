//
//  UserFeedTableViewController.swift
//  Ditto
//
//  Created by Gurneev Sareen on 4/16/16.
//  Copyright © 2016 Swag. All rights reserved.
//

import UIKit


let reuseIdentifier = "Cell"

class UserFeedTableViewController: UITableViewController {

    private var posts: [PFObject]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Downloader.sharedDownloader.queryForPosts()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "queryFeeds:", name: "queryUserFeedNotification", object: nil)

        
    }
    
    func queryFeeds(notification: NSNotification) {
        posts = notification.object as? [PFObject]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

// MARK: - Table view data source

extension UserFeedTableViewController {


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "hello its me"
        

        return cell
    }
    


    

}
