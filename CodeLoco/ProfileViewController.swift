//
//  ProfileViewController.swift
//  CodeLoco
//
//  Created by Kartikey Singh on 4/3/21.
//

import UIKit
import Parse
import AlamofireImage
import NotificationBannerSwift

class ProfileViewController: UIViewController {

    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var nextLevelLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
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
            let level = currentUser!["level"] as! Int
            let total_points = currentUser!["total_points"] as! Int
            let next_level = (total_points % 100)
            
            if currentUser!["profile_image"] != nil {
                let imageFile = currentUser!["profile_image"] as! PFFileObject
                let urlString = imageFile.url!
                let url = URL(string: urlString)!
                profileImage.af.setImage(withURL: url)
            }
            else {
                print("USER DID NOT SET PROFILE IMAGE")
            }
        
            print(level)
            print(total_points)
            levelLabel.text = "Level \(String(level))"
            //nextLevelLabel.text = "Level up in \(String(next_level)) points"
            nextLevelLabel.text = "\(String(next_level + ((level - 1) * 100 )))/\(String(level * 100))"
            usernameLabel.text = currentUser?.username
            joinedLabel.text = "Joined " + joined
            
            let prog = Float((total_points % 100)) / 100.0 as Float
            print(prog)
            self.progressView.setProgress(prog, animated: true)
                
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
