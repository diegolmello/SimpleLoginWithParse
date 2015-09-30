//
//  SignUpViewController.swift
//  SimpleLoginWithParse
//
//  Created by Diego Mello on 9/29/15.
//  Copyright © 2015 Diego Mello. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signUpAction(sender: AnyObject) {
        let email = emailField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let username = usernameField.text
        let password = passwordField.text
        
        // Validation
        if password?.characters.count < 8 {
            let alert = UIAlertController(title: "Invalid", message: "Password must be greater than 8 characters", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if !isValidEmail(email!) {
            let alert = UIAlertController(title: "Invalid", message: "Email is invalid", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)

        } else {
            
            let user = PFUser()
            
            user.email = email
            user.username = username
            user.password = password
            
            user.signUpInBackgroundWithBlock({ succeeded, error in
                if succeeded {
                    self.performSegueWithIdentifier("SignUpSuccesful", sender: nil)
                } else {
                    self.showErrorView(error!)
                }
            })
            
        }
    }
    
    @IBAction func CancelAction(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailField.delegate = self
        usernameField.delegate = self
        passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
