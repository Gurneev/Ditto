//
//  Downloader.swift
//  Ditto
//
//  Created by Gurneev Sareen on 4/16/16.
//  Copyright © 2016 Swag. All rights reserved.
//

import UIKit


let queryNoticiation = "queryUserFeedNotification"

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
                            let obj = object as![PFObject]
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


    func postFeed(text: String){
        PFGeoPoint.geoPointForCurrentLocationInBackground { (geopoint , error) in
            if let geopoint = geopoint {
                let object = PFObject(className: "UserFeed")
                object.setValue(text, forKey: "post")
                object.setValue(geopoint, forKey: "location")
                object.setValue(PFUser.currentUser(), forKey: "fromUser")
            }
    }












}



