//
//  NewPostViewController.swift
//  Ditto
//
//  Created by Gurneev Sareen on 4/16/16.
//  Copyright © 2016 Swag. All rights reserved.
//

import UIKit

protocol NewPostViewController: class {

    dismissNewPostViewController(viewController: NewPostViewController)
    
}

class NewPostViewController: UIViewController {

    //Delegate Object
    weak var delegate: NewPostViewControllerDelegate? {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "posted:", name: postNotification, object: nil)
    }

    
    
    func dismissNewPostViewController(viewContrller: NewPostViewController)
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func posted(notification: NSNotification){
        if let success = notification.object as? Bool {
            if success {
                
                //Dismiss
                delegate?.dismissNewPostViewController(self)
                
            } else {
                
                let alert = UIAlertController(title: "Error", message: "Could not post", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
                    //self.dismissViewControllerAnimated(true, completion: nil)
                    
                }))
                
                self.presentViewController(alert, animated: true, completion: nil)
            
            }
        }
    }
    
    
    
    @IBOutlet weak var postTextView: UITextView!

    
    @IBAction func dismissViewController(sender: UIBarButtonItem) {
    
    
    }   
    
    
    @IBAction func sendPost(sender: UIBarButtonItem) {
        if (postTextView.text != nil){
            Downloader.sharedDownloader.postFeed(postTextView.text)
        }
    }
    


}
