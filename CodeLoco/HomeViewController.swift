//
//  HomeViewController.swift
//  CodeLoco
//
//  Created by Nemir Gandhi on 4/3/21.
//

import UIKit


class HomeViewController: UIViewController {

    @IBOutlet weak var module1View: UIImageView!
    @IBOutlet weak var module2View: UIImageView!
    @IBOutlet weak var module3View: UIImageView!
    @IBOutlet weak var module4View: UIImageView!
    
    @IBOutlet weak var module1Label: UILabel!
    @IBOutlet weak var module2Label: UILabel!
    @IBOutlet weak var module3Label: UILabel!
    @IBOutlet weak var module4Label: UILabel!
    @IBOutlet weak var comingSoonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //round the radius
        module1View.layer.cornerRadius = 20
        module2View.layer.cornerRadius = 20
        module3View.layer.cornerRadius = 20
        module4View.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
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
