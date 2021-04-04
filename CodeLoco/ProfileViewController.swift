//
//  ProfileViewController.swift
//  CodeLoco
//
//  Created by Kartikey Singh on 4/3/21.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var joinedLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2;
        self.profileImage.clipsToBounds = true;
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let currentUser = PFUser.current()
        if currentUser != nil {
          // Do stuff with the user
            var createdAt = (currentUser?.createdAt)! as Date
            var joined = getAge(date: createdAt)
            usernameLabel.text = currentUser?.username
            joinedLabel.text = "Joined " + joined
            
            
        } else {
          // Show the signup or login screen
        }
    }
    
    func getAge(date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        let string = formatter.localizedString(for: date, relativeTo: Date())
        return string
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
