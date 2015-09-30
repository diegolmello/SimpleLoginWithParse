//
//  HomeViewController.swift
//  SimpleLoginWithParse
//
//  Created by Diego Mello on 9/29/15.
//  Copyright © 2015 Diego Mello. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBAction func LogOutAction(sender: AnyObject) {
        
        //
        PFUser.logOut()
        
        //
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameLabel.text = "@" + (PFUser.currentUser()?.username)!
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
