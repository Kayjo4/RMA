//
//  FirstViewController.swift
//  RMA
//
//  Created by CIS Student on 10/31/16.
//  Copyright © 2016 RMA. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {


    @IBAction func alertMessage(sender: AnyObject) {
        
        let title = "Submit Acronym"
        let message = "Are you sure you want to submit?"
        let okText = "Submit"
        //let noText = "Cancel"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Cancel, handler: nil)
        //let cancelButton = UIAlertAction(title: noText, style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(okayButton)
        //alert.addAction(cancelButton)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

