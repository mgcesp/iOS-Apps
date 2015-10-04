//
//  TeamTableViewController.swift
//  Footy
//
//  Created by Manuel Cespedes on 8/27/15.
//  Copyright (c) 2015 DevBros. All rights reserved.
//

import UIKit

//var squad = [Player](count: 3, repeatedValue: Player(name: "Add Player", position: ""))

class TeamTableViewController: UITableViewController {
    
    // new Player Model
    var player: Player?
    
    // array of set number of Players
    var squad = [Player](count: 3, repeatedValue: Player(name: "Add Player", position: ""))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // check that player is not optional
        if let newPlayer = player {
            
            for var index = 0; index < squad.count; index++ {
                println(index).
                println(player?.name)
                
                // find first open spot and save new player
                if squad[index].name == "Add Player" {
                    squad[index] = newPlayer
                    break
                }
                
            }
        }
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return squad.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("teamPlayer", forIndexPath: indexPath) as! TeamTableViewCell
        
        let player = squad[indexPath.row]
        
        cell.configureCellWith(player)

        return cell
    }

}
