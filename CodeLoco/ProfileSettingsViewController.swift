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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        let currentUser = PFUser.current()
                if currentUser != nil {
                    let imageData = imageView.image!.pngData()
                    let file = PFFileObject(data: imageData!)
        
                    currentUser!["profile_image"] = file
        
                    currentUser?.saveInBackground{(success, error) in
                        if success{
                            self.dismiss(animated: true, completion: nil)
                        }
                        else{
                            print("Error")
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
