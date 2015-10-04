//
//  PlayerTableViewController.swift
//  ProEleven
//
//  Created by Manuel Cespedes on 9/29/15.
//  Copyright © 2015 DevBros. All rights reserved.
//

import UIKit
import CoreData

class PlayerTableViewController: UITableViewController {
    
    // MARK: Properties
    var tableList: Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        // Reference the application's delegate
        let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Reference the context
        let theContext: NSManagedObjectContext = delegate.managedObjectContext
        
        // Reference the entity
        let request = NSFetchRequest(entityName: "Players")
        // Try to assign the entity to the list
        tableList = try! theContext.executeFetchRequest(request)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Reference cell from table view
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! PlayerTableViewCell

        // Reference data object
        let data: NSManagedObject = tableList[indexPath.row] as! NSManagedObject
        
        // Update the cell's UI elements
        cell.cellNameLabel.text = data.valueForKey("name") as? String
        // Get image data and convert it to an UIImage
        let imageData = data.valueForKey("avatar") as? NSData
        cell.cellPlayerImage.image = UIImage(data: imageData!)
        
        return cell
    }
    // Allows for slide right feature
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // Reference the application's delegate
        let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Reference the context
        let theContext: NSManagedObjectContext = delegate.managedObjectContext
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            theContext.deleteObject(tableList[indexPath.row] as! NSManagedObject)
            tableList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
        var error: NSError? = nil
        
        do {
            try theContext.save()
        } catch let error1 as NSError {
            error = error1
            print(error)
            abort()
        }
    }
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditPlayer" {
            // Reference the selected player using the table
            let selectedPlayer: NSManagedObject = tableList[self.tableView.indexPathForSelectedRow!.row] as! NSManagedObject
            
            let viewController: DetailViewController = segue.destinationViewController as! DetailViewController
            
            viewController.nameEdit = selectedPlayer.valueForKey("name") as! String
            let imageData = selectedPlayer.valueForKey("avatar")
            viewController.avatarEdit = UIImage(data: imageData as! NSData)
            viewController.playerToEdit = selectedPlayer
        }
        else if segue.identifier == "AddPlayer" {
            
        }
    }

}




















