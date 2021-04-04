//
//  SignUpViewController.swift
//  CodeLoco
//
//  Created by Nemir Gandhi on 4/4/21.
//

import UIKit
import Parse

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
            
        user.signUpInBackground { (success, error) in
            if success{
                self.performSegue(withIdentifier: "signupSegue", sender: nil)
            } else{
                print("Error")
            }
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


