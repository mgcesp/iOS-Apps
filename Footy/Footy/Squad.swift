//
//  Squad.swift
//  Footy
//
//  Created by Manuel Cespedes on 8/27/15.
//  Copyright (c) 2015 DevBros. All rights reserved.
//

import Foundation
import UIKit

class Squad {
    
    var players: [Player]
    
    init (includePlayers: [Player]) {
        self.players = includePlayers
    }
    
    class func fillPlayers() -> [Player] {
        var team = [Player]()
        
        team.append(Player(name: "Cristiano Ronaldo", position: "LW"))
        team.append(Player(name: "Angel Di Maria", position: "LM"))
        team.append(Player(name: "Lionel Messi", position: "RW"))
        team.append(Player(name: "Arjen Robben", position: "RW"))
        
        return team
    }
    
    class func createSquad() -> [Player] {
        var team = [Player]()
        return team
    }
    
}