//
//  ProfileViewController.swift
//  CodeLoco
//
//  Created by Kartikey Singh on 4/3/21.
//

import UIKit
import Parse
import AlamofireImage

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
        setFields()
    }
    
    func getAge(date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        let string = formatter.localizedString(for: date, relativeTo: Date())
        return string
    }

    func setFields(){
        let currentUser = PFUser.current()
        if currentUser != nil {
            let createdAt = (currentUser?.createdAt)! as Date
            let joined = getAge(date: createdAt)

            if currentUser!["profile_image"] != nil {
                let imageFile = currentUser!["profile_image"] as! PFFileObject
                let urlString = imageFile.url!
                let url = URL(string: urlString)!
                profileImage.af_setImage(withURL: url)
            }
            else {
                print("USER DID NOT SET PROFILE IMAGE")
            }
        
            usernameLabel.text = currentUser?.username
            joinedLabel.text = "Joined " + joined
            
        }
    }
   
    
    @IBAction func onLogoutBUtton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "loginViewController")
        
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        
        delegate.window?.rootViewController = loginViewController
    }
    
}
