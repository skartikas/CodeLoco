//
//  LessonsViewController.swift
//  CodeLoco
//
//  Created by Brock Donahue on 4/24/21.
//

import UIKit
import Parse

class LessonsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleText = String()
    let user = PFUser.current()
    var lessons = [Dictionary<String,Any>]()
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
        tableView.dataSource = self
        tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lessons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonBlock", for: indexPath) as! LessonsTableViewCell
        cell.lessonTitle.text = (lessons[indexPath.row]["Title"] as! String)
        let currentModule = lessons[indexPath.row]["ModuleAtt"] as! String
        let currentLesson = lessons[indexPath.row]["LessonAtt"] as! String
        let onionLayer1 = user!["ModuleProgress"] as! [Dictionary<String,Dictionary<String,Any>>]
        let onionLayer2 = onionLayer1[0]
        let onionLayer3 = onionLayer2[currentModule]
        print(onionLayer3)
        let onionLayer4 = onionLayer3![currentLesson] as! Int
        cell.lessonProgressBar.progress = Float(onionLayer4)
        print(onionLayer4)
        let progressPercent = String(format: "%.0f%@", Float(onionLayer4)*100, "%" )
        cell.lessonProgressLabel.text = progressPercent
        // Configure the cell...

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let index = tableView.indexPath(for: cell)!
        let data = lessons[index.row]
        let lessonTableView = segue.destination as! LessonViewController
        lessonTableView.lessonData = data
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.reloadData()
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
