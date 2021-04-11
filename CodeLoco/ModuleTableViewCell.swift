//
//  ModuleTableViewCell.swift
//  CodeLoco
//
//  Created by Brock Donahue on 4/10/21.
//

import UIKit

class ModuleTableViewCell: UITableViewCell {

    @IBOutlet weak var firstModule: UIButton!
    
    @IBOutlet weak var secondModule: UIButton!
    
    @IBOutlet weak var thirdModule: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        firstModule.layer.cornerRadius = 20
        secondModule.layer.cornerRadius = 20
        thirdModule.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func displayFirstModule(_ sender: Any) {
    }
    
}
