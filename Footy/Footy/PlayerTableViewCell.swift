//
//  PlayerTableViewCell.swift
//  Footy
//
//  Created by Manuel Cespedes on 8/27/15.
//  Copyright (c) 2015 DevBros. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var addPlayerButton: UIButton!
    
    func configureCellWith (player: Player) {
        playerName.text = player.name
        playerPosition.text = player.position
    }
}
