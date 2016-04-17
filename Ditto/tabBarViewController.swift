//
//  tabBarViewController.swift
//  Ditto
//
//  Created by Hamilton Coke on 4/17/16.
//  Copyright © 2016 Swag. All rights reserved.
//

import UIKit

class tabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
                    // Sets the default color of the icon of the selected UITabBarItem and Title
                    UITabBar.appearance().tintColor = UIColor.redColor()
                
                // Sets the default color of the background of the UITabBar
                UITabBar.appearance().barTintColor = UIColor.blackColor()
                
                // Sets the background color of the selected UITabBarItem (using and plain colored UIImage with the width = 1/5 of the tabBar (if you have 5 items) and the height of the tabBar)
        
                
                // Uses the original colors for your images, so they aren't not rendered as grey automatically.
                               }
    
    
    
        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
