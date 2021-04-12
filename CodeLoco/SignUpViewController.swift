//
//  SignUpViewController.swift
//  CodeLoco
//
//  Created by Nemir Gandhi on 4/4/21.
//

import UIKit
import Parse
import NotificationBannerSwift

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss (animated: true, completion: nil)
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.email = emailField.text
        
        user["First_Name"] = firstNameField.text
        user["Last_Name"] = lastNameField.text
        user["total_points"] = 150
        user["level"] = 0
            
        user.signUpInBackground { (success, error) in
            if success{
                self.performSegue(withIdentifier: "signupSegue", sender: nil)
                displayAchievement()
            } else{
                print("Error")
            }
        }
    }
   
}
    
    

func displayAchievement() {
    let currentUser = PFUser.current()
    if currentUser != nil {
        let level = currentUser!["level"] as! Int
        let total_points = currentUser!["total_points"] as! Int
        
        let calculated_level = total_points / 100
        
        if calculated_level != level {
            let banner = NotificationBanner(title: "Congratulations!", subtitle: "You haved reached level \(calculated_level)", style: .success)
            banner.show()
            
            currentUser?["level"] = calculated_level
            
            currentUser?.saveInBackground()
        }
        
        
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


