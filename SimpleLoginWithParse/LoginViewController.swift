//
//  LoginViewController.swift
//  SimpleLoginWithParse
//
//  Created by Diego Mello on 9/29/15.
//  Copyright © 2015 Diego Mello. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginAction(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) { user, error in
            
            if user != nil {
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
            } else {
                self.showErrorView(error!)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        passwordField.delegate = self

        // Do any additional setup after loading the view.
        if let user = PFUser.currentUser() {
            if user.isAuthenticated() {
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        let nextResponder = textField.superview?.viewWithTag(nextTag)
        
        if (nextResponder != nil) {
            nextResponder?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }

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
