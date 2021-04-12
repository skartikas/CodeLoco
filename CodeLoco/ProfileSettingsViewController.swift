//
//  ProfileSettingsViewController.swift
//  CodeLoco
//
//  Created by Kartikey Singh on 4/10/21.
//

import UIKit
import AlamofireImage
import Parse

class ProfileSettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let currentUser = PFUser.current()
        if currentUser != nil {
            usernameField.placeholder = currentUser!["username"] as! String
            passwordField.placeholder = "New password"
            
            if currentUser!["profile_image"] != nil {
                let imageFile = currentUser!["profile_image"] as! PFFileObject
                let urlString = imageFile.url!
                let url = URL(string: urlString)!
                imageView.af_setImage(withURL: url)
            }
            
        }
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        let currentUser = PFUser.current()
                if currentUser != nil {
                    let imageData = imageView.image!.pngData()
                    let file = PFFileObject(data: imageData!)
        
                    currentUser!["profile_image"] = file
                    
                    if usernameField.text != "" {
                        currentUser!["username"] = usernameField.text as! String
                    }
                    if passwordField.text != "" {
                        currentUser!["password"] = passwordField.text as! String
                    }
        
                    currentUser?.saveInBackground{(success, error) in
                        if success{
                            _ = self.navigationController?.popViewController(animated: true)
                        }
                        else{
                            print("Error saving settings")
                        }
                    }
                }
    }
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
                picker.delegate = self
                picker.allowsEditing = true
        
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    picker.sourceType = .camera
                }else{
                    picker.sourceType = .photoLibrary
                }
        
        
                present(picker, animated: true, completion: nil)
       
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 150, height: 150)
        let scaledImage = image.af_imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
        
    }
}
