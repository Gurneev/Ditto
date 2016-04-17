//
//  CategoriesTableViewController.swift
//  Ditto
//
//  Created by Hamilton Coke on 4/16/16.
//  Copyright © 2016 Swag. All rights reserved.
//

import UIKit
import Parse

let reuseIdentifier = "Cell"
var array = [String]()


class CategoriesTableViewController: UITableViewController {
    var categories:[PFObject]!
    
    
    init() {
        categoriesArray = []
        super.init(style: UITableViewStyle.Plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        categoriesArray = []
        super.init(coder: aDecoder)
    }
    
    var categoriesArray: [Int]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        categories =  []
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }

    func getData() {
        
        let query = PFQuery(className: "category")
        query.findObjectsInBackgroundWithBlock { (objects, error) in
            if error != nil {
                
                for object in objects! {
                    self.categories.append(object)
                }
                
            }
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyCustomTableViewCell
        
        array = ["black", "gay", "Racial"]
        cell.categoryLabel.text = "rectom"
        cell.descriptionLabel.text = "Description"

        return cell
    }
    
    class MyCustomTableViewCell: UITableViewCell {
        @IBOutlet weak var categoryLabel: UILabel!
        @IBOutlet weak var descriptionLabel: UILabel!
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
