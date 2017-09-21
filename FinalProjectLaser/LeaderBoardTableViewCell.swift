//
//  LeaderBoardTableViewCell.swift
//  FinalProjectLaser
//
//  Created by Livleen Rai on 2017-09-13.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import UIKit

class LeaderBoardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var name = ""
    var score = 0
    
    func setLabels() {
        nameLabel.text = name
        scoreLabel.text = String(self.score)
    }
    
}
