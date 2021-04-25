//
//  LessonViewController.swift
//  CodeLoco
//
//  Created by Brock Donahue on 4/25/21.
//

import UIKit
import AlamofireImage
import Parse

class LessonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var lessonData = Dictionary<String,Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonTableViewCell", for: indexPath) as! LessonTableViewCell
        cell.titleLabel.text = lessonData["Title"] as? String ?? "Oops an error has occured."
        cell.lessonLabel.text = lessonData["Entry1"] as? String ?? "Oops an error has occured."
        let urlString = lessonData["Pic1"] as? String ?? "Oops"
        
        let imageUrl = URL(string: urlString)!
        
        cell.lessonPic.af_setImage(withURL: imageUrl)
        cell.picCaption.text = lessonData["Caption1"] as? String ?? "Oops, an error has occured."
        // Configure the cell...

        return cell
    }

    @IBAction func finishLesson(_ sender: Any) {
        let user = PFUser.current()
        print(user)
        if user != nil{
            let currentPoints = user!["total_points"] as! Int
            user!["total_points"] = currentPoints + 100
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

}
