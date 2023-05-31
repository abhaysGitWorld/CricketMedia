//
//  MyTableViewCell2.swift
//  CricketMedia
//
//  Created by Abhay Singh on 27/05/23.
//

import UIKit

class MyTableViewCell2: UITableViewCell {

    @IBOutlet weak var captainOrWk: UILabel!
    @IBOutlet weak var playername: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
