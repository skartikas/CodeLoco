//
//  LessonsTableViewCell.swift
//  CodeLoco
//
//  Created by Brock Donahue on 4/24/21.
//

import UIKit

class LessonsTableViewCell: UITableViewCell {

    @IBOutlet weak var lessonImage: UIImageView!
    @IBOutlet weak var lessonProgressBar: UIProgressView!
    @IBOutlet weak var lessonProgressLabel: UILabel!
    @IBOutlet weak var lessonTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
