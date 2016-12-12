//
//  RegistrationViewController.swift
//  RMA
//
//  Created by CIS Student on 11/28/16.
//  Copyright © 2016 RMA. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var passwordValidityTextField: UITextField!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
        registerButton.layer.cornerRadius = registerButton.frame.size.width / 6
    }
    
    
    @IBAction func dismissButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userRetypePassword = passwordValidityTextField.text
        
        //check for empty fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRetypePassword?.isEmpty)!) {
            
            //Display alert message
            displayMyAlertMessage(userMessage: "All fields are required")
            
            return
        }
        
        //check if passwords match
        if(userPassword != userRetypePassword) {
            
            //display alert message
            displayMyAlertMessage(userMessage: "Passwords do not match")
            
            return
            
        }
        
        //store data
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        
        UserDefaults.standard.synchronize()
        
        
        //Display alert message with confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Registration successful", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { action in self.dismiss(animated: true, completion: nil)
        
        }
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func displayMyAlertMessage(userMessage: String) {
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
    }

    
}
