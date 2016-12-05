//
//  LoginViewController.swift
//  RMA
//
//  Created by CIS Student on 11/28/16.
//  Copyright © 2016 RMA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIViewControllerTransitioningDelegate{

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var transitionButton: UIButton!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = loginButton.frame.size.width / 2
        //loginButton.constant -= view.bounds.width
        
        animation()
        
        //loginButton.layer.cornerRadius = loginButton.frame.size.width / 2
        transitionButton.layer.cornerRadius = transitionButton.frame.size.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let regisrationVC = segue.destination as! RegistrationViewController
        regisrationVC.transitioningDelegate = self
        regisrationVC.modalPresentationStyle = .custom
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = transitionButton.center
        transition.circleColor = transitionButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = transitionButton.center
        transition.circleColor = transitionButton.backgroundColor!
        
        return transition
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        
        let userEmailStored = UserDefaults.standard.string (forKey: "userEmail")
        
        let userPasswordStored = UserDefaults.standard.string (forKey: "userPassword")
        
        //check if password is incorrect
        if(userEmailStored == userEmail){
            
            if(userPasswordStored == userPassword) {
                
                //login is successful
                UserDefaults.standard.set(true, forKey: "isuserLoggedIn")
                
                UserDefaults.standard.synchronize()
                
                self.dismiss(animated: true, completion: nil)
            } else {

                //login unsuccessful
                displayMyAlertMessage(userMessage: "Incorrect Password! Please try again.")
                
            }
        } else {
            
            //login unsuccessful
            displayMyAlertMessage(userMessage: "Incorrect Email or Password! Please try again.")
            
        }
        
        //check for empty fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)!) {
            
            //Display alert message
            displayMyAlertMessage(userMessage: "All fields are required")
            
            return
        }
        
    }
    
    func displayMyAlertMessage(userMessage: String) {
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
    }
    

    func animation() {
        
        UIView.animate(withDuration: 5, delay: 0, animations: {
            
            self.loginButton.frame.origin.x -= 143
            
            
        }) { _ in
            
            UIView.animate(withDuration: 1, animations: {
                //self.loginButton.constant += self.view.bounds.width
                self.loginButton.frame.origin.x -= -500
                //self.loginButton.frame.origin.y -= 607
                //self.loginButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                
            })
            
        }
        
        UIView.animate(withDuration: 5) {
            self.loginButton.frame = CGRect(x: -357, y: 191, width: 88, height: 30)
        }
        
        
    }
    


}
