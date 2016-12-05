//
//  RateTableViewController.swift
//  RMA
//
//  Created by CIS Student on 11/4/16.
//  Copyright © 2016 RMA. All rights reserved.
//

import UIKit

class RateTableViewController: UITableViewController {
    
    var dummyData = DummyData()

    @IBOutlet weak var starRating: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableCell(withIdentifier: "rateHeader") as! RateHeaderTableViewCell
        view.backgroundColor = UIColor.blue
        view.RateHeader.textColor = UIColor.white
        
        switch(section) {
        case 0:
            view.RateHeader.text = "Top Rated"
            return view
        case 1:
            view.RateHeader.text = "Everyone Else"
            return view
        default:
            return nil
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch (section) {
        case 0:
            return dummyData.TopRatedAcronyms.count
        case 1:
            return dummyData.EveryoneElse.count
        default:
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rateCell", for: indexPath) as! RateTableViewCell
        
        switch (indexPath.section) {
        case 0:
            cell.RatedAcronyms.text = dummyData.TopRatedAcronyms[indexPath.row]
            break
        case 1:
            cell.RatedAcronyms.text = dummyData.EveryoneElse[indexPath.row]
            break
        default:
            break
        }

        // Configure the cell...

        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey:"isUserLoggedIn")
        
        //not working????
        if(!isUserLoggedIn){
            
            self.performSegue(withIdentifier: "loginView", sender: self)
            
            //self.dismiss(animated: false, completion: nil)
        }
        
        
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        /*
        let loginViewController = self.storyboard!.instantiateViewController(withIdentifier: "loginView") as! LoginViewController
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = loginViewController
        
        appDelegate.window?.makeKeyAndVisible()
 */
        
        self.performSegue(withIdentifier: "loginView", sender: self)
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
