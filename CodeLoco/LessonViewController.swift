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
        return lessonData["NumOfEntries"] as! Int
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
        if user != nil{
            let currentModule = lessonData["ModuleAtt"] as! String
            let currentLesson = lessonData["LessonAtt"] as! String
            var onionLayer1 = user!["ModuleProgress"] as! [Dictionary<String,Dictionary<String,Any>>]
            let onionLayer2 = onionLayer1[0]
            let onionLayer3 = onionLayer2[currentModule]
            let onionLayer4 = onionLayer3![currentLesson] as! Int
            if onionLayer4 != 1{
                let currentPoints = user!["total_points"] as! Int
                let currentLevel = user!["level"] as! Int
                user?.setValue(currentPoints + 100, forKey: "total_points")
                user?.setValue(currentLevel + 1, forKey: "level")
                onionLayer1[0][currentModule]![currentLesson] = 1
                user?.setValue(onionLayer1, forKey:"ModuleProgress" )
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

}
