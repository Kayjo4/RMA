//
//  RateTableViewController.swift
//  RMA
//
//  Created by CIS Student on 11/4/16.
//  Copyright © 2016 RMA. All rights reserved.
//

import UIKit

class RateTableViewController: UITableViewController {
    
    var dummyData = DummyData2()

    @IBOutlet weak var starRating: RatingControl!
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if dummyData.getAcronymType(type: section).count == 0 {
            return 0
        } else {
            return 40
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dummyData.acronymTypeCount
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableCell(withIdentifier: "rateHeader") as! RateHeaderTableViewCell

        view.RateHeader.textColor = UIColor.white
        view.RateHeader.text = dummyData.types[section]
        
        return view.contentView
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.getAcronymType(type: section).count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rateCell", for: indexPath) as! RateTableViewCell
        
        cell.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = UIColor.clear
        cell.containerView.layer.borderColor = UIColor.black.cgColor
        cell.containerView.layer.cornerRadius = 8
        cell.containerView.layer.borderWidth = 1
        
        let acronyms = dummyData.getAcronymType(type: indexPath.section)
        cell.ratedAcronyms.text = acronyms[indexPath.row].name
        cell.definitionTextView.text = acronyms[indexPath.row].definition
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey:"isUserLoggedIn")
        
        if(!isUserLoggedIn){
            
            self.performSegue(withIdentifier: "loginView", sender: self)
            
            
        }
        
        tableView.reloadData()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FirstViewController {
            vc.delegate = self
        }
    }
}

protocol AcronymDelegate {
    func addAcronym(type: Acronym.AcronymType, acronym: String, definition: String)
}

extension RateTableViewController: AcronymDelegate {
    func addAcronym(type: Acronym.AcronymType, acronym: String, definition: String) {
        let newAcronym = Acronym(type: type, name: acronym, def: definition)
        dummyData.acronyms.append(newAcronym)
    }
}
