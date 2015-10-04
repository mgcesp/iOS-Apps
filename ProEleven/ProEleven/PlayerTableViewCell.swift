//
//  PlayerTableViewCell.swift
//  ProEleven
//
//  Created by Manuel Cespedes on 9/29/15.
//  Copyright © 2015 DevBros. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellPlayerImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
