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
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 80
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableCell(withIdentifier: "rateHeader") as! RateHeaderTableViewCell
        view.backgroundColor = UIColor.clear
        view.RateHeader.textColor = UIColor.white
        
        //let headerView = UIView()
        //headerView.backgroundColor = UIColor.clear
        
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
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
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
        
        if(!isUserLoggedIn){
            
            self.performSegue(withIdentifier: "loginView", sender: self)
            
            
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
}
