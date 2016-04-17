//
//  UserFeedTableViewController.swift
//  Ditto
//
//  Created by Gurneev Sareen on 4/16/16.
//  Copyright © 2016 Swag. All rights reserved.
//

import UIKit
import Parse

//let reuseIdentifier = "Cell"

class Post {
    var post:String!
    var user:PFUser
    var parseObject:PFObject!
    
    init(object: PFObject) {
        post = object.valueForKey("post") as! String
        user = object.valueForKey("fromUser") as! PFUser
        parseObject = object
    }
}

class UserFeedTableViewController: UITableViewController {

    private var posts: [Post]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Downloader.sharedDownloader.queryForPosts()
        
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)

    
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "queryFeeds:", name: "queryUserFeedNotification", object: nil)
        
        posts = []
        
    }
    

    func refresh(sender:AnyObject){
        
        Downloader.sharedDownloader.queryForPosts()
    }

    func queryFeeds(notification: NSNotification) {
//        posts = notification.object as? [PFObject]
        let objects = notification.object as? [PFObject]
        for object in objects! {
            posts?.append(Post(object: object))
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    class MyCustomTableViewCell: UITableViewCell {
        
        
        
    }
}

// MARK: - Table view data source

extension UserFeedTableViewController {


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (posts?.count)!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "hello its me"
        cell.textLabel?.text = posts![indexPath.row].post!
        

        return cell
    }
    

    

}
