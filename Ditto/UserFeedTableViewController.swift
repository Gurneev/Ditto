//
//  UserFeedTableViewController.swift
//  Ditto
//
//  Created by Gurneev Sareen on 4/16/16.
//  Copyright © 2016 Swag. All rights reserved.
//

import UIKit
import Parse

class Post {
    var title:String!
    var description:String!
    var user:PFUser
    var parseObject:PFObject!
    var category:PFObject!
    var upvoteCount:Int!
    
    init(object: PFObject) {
        title = object.valueForKey("post") as! String
        user = object.valueForKey("fromUser") as! PFUser
        description = object.valueForKey("description") as! String
//        category = object.valueForKey("category") as! PFObject
        upvoteCount = 0
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
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "queryFeeds:", name: "queryUserFeedNotification", object: nil)
        
        posts = []
        
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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (posts?.count)!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! postCell

        // Configure the cell...
        cell.setContent(posts![indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
    }

}

class postCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var upvoteCount: UILabel!
    
    func setContent(post: Post) {
        title.text = post.title
        print(post.title)
//        descriptionLabel.text = post.description
//        category = post.category.valueForKey("title")
        upvoteCount.text = "\(post.upvoteCount)"
    }
}