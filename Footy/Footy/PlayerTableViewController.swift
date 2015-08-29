//
//  PlayerTableViewController.swift
//  Footy
//
//  Created by Manuel Cespedes on 8/27/15.
//  Copyright (c) 2015 DevBros. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
    
    var players:[Player] {
        var squad = Squad.fillPlayers()
        return squad
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return players.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("player", forIndexPath: indexPath) as! PlayerTableViewCell

        // Configure the cell...
        let player = players[indexPath.row]
        cell.configureCellWith(player)
        
        // Add a tag to the button pressed
        cell.addPlayerButton.tag = indexPath.row
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            
                case "Player Detail":
                let viewController = segue.destinationViewController as! DetailViewController
                
                if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                    
                    viewController.player = players[indexPath.row]
                }
                
                case "Add Player":
                let view = segue.destinationViewController as! TeamTableViewController
                // use the button's tag to retrieve chosen player
                view.player = players[sender!.tag]
                
                
            default: break
            }
        }
    }
    
    func playerAtIndexPath(indexPath: NSIndexPath) -> Player {
        let player = players[indexPath.row]
        return player
    }

}





















