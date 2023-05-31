//
//  MyTableViewCell.swift
//  CricketMedia
//
//  Created by Abhay Singh on 27/05/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
        
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var matchName: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
