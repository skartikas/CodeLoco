//
//  ModuleTableViewCell.swift
//  CodeLoco
//
//  Created by Brock Donahue on 4/10/21.
//

import UIKit

class ModuleTableViewCell: UITableViewCell {
    @IBOutlet weak var firstModule: UIImageView!
    
    @IBOutlet weak var secondModule: UIImageView!
    
    @IBOutlet weak var thirdModule: UIImageView!
    
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

}
