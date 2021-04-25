//
//  QuizViewController.swift
//  CodeLoco
//
//  Created by Brock Donahue on 4/25/21.
//

import UIKit
import Parse
import AlamofireImage

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    let user = PFUser.current()
    var questionsList = [PFObject]()
    var correct = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.reloadData()
        let query = PFQuery(className: "Questions")
        query.limit = 10
        query.includeKey("questions")
        query.findObjectsInBackground{ (questionsList, errors) in
            if questionsList != nil{
                self.questionsList = questionsList!
                self.tableView.reloadData()
            }
        
        // Do any additional setup after loading the view.
        
    }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizTableViewCell") as! QuizTableViewCell
        if questionsList.count != 0{
            let index = Int.random(in: 0..<questionsList.count)
            let currentQuestion = questionsList[index]
        cell.questionLabel.text = (currentQuestion["question"] as! String)
        let answers = currentQuestion["Answers"] as! Array<String>
        let correctIndex = currentQuestion["answerIndex"] as! Int
        correct = correctIndex
            
        cell.firstAnswer.setTitle(answers[0], for: .normal)
        cell.firstAnswer.layer.cornerRadius = 10
        cell.firstAnswer.layer.borderColor = UIColor.white.cgColor
        cell.firstAnswer.layer.borderWidth = 2
            
        
        cell.secondAnswer.setTitle(answers[1], for: .normal)
        cell.secondAnswer.layer.cornerRadius = 10
            cell.secondAnswer.layer.borderColor = UIColor.white.cgColor
        cell.secondAnswer.layer.borderWidth = 2
            
            
        cell.thirdAnswer.setTitle(answers[2], for: .normal)
        cell.thirdAnswer.layer.cornerRadius = 10
        cell.thirdAnswer.layer.borderColor = UIColor.white.cgColor
        cell.thirdAnswer.layer.borderWidth = 2
            
        
        cell.fourthAnswer.setTitle(answers[3], for: .normal)
        cell.fourthAnswer.layer.cornerRadius = 10
        cell.fourthAnswer.layer.borderColor = UIColor.white.cgColor
        cell.fourthAnswer.layer.borderWidth = 2
            
        let urlString = currentQuestion["questionImage"] as! String
        let url = URL(string: urlString)!
            cell.questionImage.af.setImage(withURL: url)
        }
        cell.selectionStyle = .none
        return cell
    }
    @IBAction func firstAnswerChosen(_ sender: Any) {
        if correct == 0{
            let currentPoints = user!["total_points"] as! Int
            let currentLevel = user!["level"] as! Int
            user?.setValue(currentPoints + 100, forKey: "total_points")
            user?.setValue(currentLevel + 1, forKey: "level")
        }
        self.viewDidLoad()
    }
    @IBAction func secondAnswerChosen(_ sender: Any) {
        if correct == 1{
            let currentPoints = user!["total_points"] as! Int
            let currentLevel = user!["level"] as! Int
            user?.setValue(currentPoints + 100, forKey: "total_points")
            user?.setValue(currentLevel + 1, forKey: "level")
        }
        self.viewDidLoad()
    }
    @IBAction func thirdAnswerChosen(_ sender: Any) {
        if correct == 2{
            let currentPoints = user!["total_points"] as! Int
            let currentLevel = user!["level"] as! Int
            user?.setValue(currentPoints + 100, forKey: "total_points")
            user?.setValue(currentLevel + 1, forKey: "level")
        }
        self.viewDidLoad()
    }
    @IBAction func fourthAnswerChosen(_ sender: Any) {
        if correct == 3{
            let currentPoints = user!["total_points"] as! Int
            let currentLevel = user!["level"] as! Int
            user?.setValue(currentPoints + 100, forKey: "total_points")
            user?.setValue(currentLevel + 1, forKey: "level")
        }
        self.viewDidLoad()
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

