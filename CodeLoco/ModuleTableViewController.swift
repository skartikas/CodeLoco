//
//  ModuleTableViewController.swift
//  CodeLoco
//
//  Created by Brock Donahue on 4/10/21.
//

import UIKit
import Parse

class ModuleTableViewController: UITableViewController {
    var modules = [PFObject]()
    var trueIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFQuery(className: "Module")
        query.limit = 10
        query.includeKey("moduleNum")
        query.includeKey("Lessons")
        query.findObjectsInBackground{ (modules, errors) in
            if modules != nil{
                self.modules = modules!
                self.tableView.reloadData()
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return modules.count/3
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moduleBlock") as! ModuleTableViewCell

        // Configure the cell...
        let moduleNumber = 3*indexPath.row
        cell.firstModule.layer.cornerRadius = 50
        cell.firstModule.layer.borderWidth = 2
        cell.firstModule.layer.borderColor = UIColor.white.cgColor
        cell.firstModule.clipsToBounds = true
        cell.secondModule.layer.cornerRadius = 50
        cell.secondModule.layer.borderColor = UIColor.white.cgColor
        cell.secondModule.layer.borderWidth = 2
        cell.secondModule.clipsToBounds = true
        cell.thirdModule.layer.cornerRadius = 50
        cell.thirdModule.layer.borderWidth = 2
        cell.thirdModule.layer.borderColor = UIColor.white.cgColor
        cell.thirdModule.clipsToBounds = true
        let firstModuleNumber = moduleNumber + 1
        let secondModuleNumber = moduleNumber + 2
        let thirdModuleNumber = moduleNumber + 3
        cell.firstModule.setTitle( String(format: "%@%x", "Module ", firstModuleNumber), for: .normal)
        cell.secondModule.setTitle( String(format: "%@%x", "Module ", secondModuleNumber), for:.normal)
        cell.thirdModule.setTitle( String(format: "%@%x", "Module ", thirdModuleNumber), for:.normal)
        
        return cell
    }
    
    
    @IBAction func firstModule(_ sender: UIButton) {
       let buttonTitle = sender.title(for: .normal)!
        let moduleNumber = buttonTitle.suffix(1)
        var index = 0
        for module in modules{
            if module["moduleNum"] as? Int == Int(moduleNumber){
                trueIndex = index
            }
            index += 1
        }
        print(trueIndex)
    }
    @IBAction func secondModule(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)!
         let moduleNumber = buttonTitle.suffix(1)
         var index = 0
         for module in modules{
             if module["moduleNum"] as? Int == Int(moduleNumber){
                 trueIndex = index
             }
             index += 1
         }
         print(trueIndex)
     }
    @IBAction func thirdModule(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)!
         let moduleNumber = buttonTitle.suffix(1)
         var index = 0
         for module in modules{
             if module["moduleNum"] as? Int == Int(moduleNumber){
                 trueIndex = index
             }
             index += 1
         }
         print(trueIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


