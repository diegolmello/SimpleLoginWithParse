//
//  ResetPasswordViewController.swift
//  SimpleLoginWithParse
//
//  Created by Diego Mello on 9/29/15.
//  Copyright © 2015 Diego Mello. All rights reserved.
//

import UIKit
import Parse

class ResetPasswordViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func CancelAction(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func resetAction(sender: AnyObject) {
        let email = emailField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        PFUser.requestPasswordResetForEmailInBackground(email!)
        
        let alert = UIAlertController(title: "Password Reset", message: "An email containing information on how to reset your password has been sent to \(email!)", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
