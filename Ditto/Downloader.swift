//
//  Downloader.swift
//  Ditto
//
//  Created by Gurneev Sareen on 4/16/16.
//  Copyright © 2016 Swag. All rights reserved.
//

import UIKit
import Parse

let queryNoticiation = "queryUserFeedNotification"
let postNotification = "postNotification"


class Downloader: NSObject {

    //singleton
    static let sharedDownloader = Downloader()
    
   
    //quesries for the posts based on campus
    func queryForPosts() {
        
        
        PFGeoPoint.geoPointForCurrentLocationInBackground { (geopoint, error ) in
            if !(error != nil) {
                if let geoPoint = geopoint{
                    let query = PFQuery(className: "UserFeed")
                    query.whereKey("location", nearGeoPoint: geoPoint, withinMiles: 5)
                    query.limit = 15
                    
                    query.findObjectsInBackgroundWithBlock { (object, error) in
                        
                        if let object = object {
                            let obj = object
                            print(obj)
                            
                    
                            dispatch_async(dispatch_get_main_queue()) {
                        NSNotificationCenter.defaultCenter().postNotificationName("queryUserFeedNotification", object: obj)
                            }
                            
                        }
                    }
                }
            }
        }
    }


    func postFeed(title: String, category: PFObject, description: String) {
        
        PFGeoPoint.geoPointForCurrentLocationInBackground { (geopoint , error) in
            if let geopoint = geopoint {
                let object = PFObject(className: "UserFeed")
                object.setValue(title, forKey: "post")
                object.setValue(geopoint, forKey: "location")
                object.setValue(category, forKey: "category")
                object.setValue(description, forKey: "description")
                
                if let user = PFUser.currentUser() {
                    object.setValue(user, forKey: "fromUser")
                }
                
                object.saveInBackgroundWithBlock({ (success, error) -> Void in
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        NSNotificationCenter.defaultCenter().postNotificationName(postNotification, object: success)
                    }
//                  
//                    let relation = category.valueForKey("posts") as! PFRelation
//                    relation.addObject(object)
//                    category.saveInBackground()
//                    
//                    category.saveInBackgroundWithBlock({ (success, error) -> Void in
//                        print("We wanna save the category")
//                    })
//                    
                })
    
            }

        }

    }
    




}
