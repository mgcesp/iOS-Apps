//
//  TeamTableViewCell.swift
//  Footy
//
//  Created by Manuel Cespedes on 8/27/15.
//  Copyright (c) 2015 DevBros. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var addPlayerButton: UIButton!
    @IBOutlet weak var addPlayerLabel: UILabel!
    
    func configureCellWith (player: Player) {
        playerName.text = player.name
        playerPosition.text = player.position
    }
    
    func showEmptyCell (player: Player) {
        playerName.text = "Add Player"
    }
}
