//
//  NewPostViewController.swift
//  Ditto
//
//  Created by Gurneev Sareen on 4/16/16.
//  Copyright © 2016 Swag. All rights reserved.
//

import UIKit
//
//protocol NewPostViewController: class {
//
//    dismissNewPostViewController(viewController: NewPostViewController)
//    
//

class NewPostViewControllerDelegate {
    
}

class NewPostViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    //Delegate Object
    weak var delegate: NewPostViewControllerDelegate?
    
    
    
    @IBOutlet weak var categoryField: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "posted:", name: postNotification, object: nil)
    
    
        self.categoryField.delegate = self
        self.categoryField.dataSource = self
        
        // Input data into the Array:
        pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    
    }

    
    
    //func dismissNewPostViewController(viewContrller: NewPostViewController)
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
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
    
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    
    
    
    @IBAction func submit(sender: UIButton) {
        var titleText = titleField.text
        var descriptionText = descriptionField.text
        var categoryChoice = categoryField.
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
