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
    @IBOutlet weak var firstModuleLabel: UILabel!
    @IBOutlet weak var secondModuleLabel: UILabel!
    
    @IBOutlet weak var thirdModuleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
