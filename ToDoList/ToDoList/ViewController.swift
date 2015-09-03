//
//  ViewController.swift
//  ToDoList
//
//  Created by Manuel Cespedes on 8/31/15.
//  Copyright (c) 2015 DevBros. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    
    // Model (datasource) fot the table view
    var items = [NSManagedObject]() // NSManagedObject is an object in CoreData
    
    // MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the title for the view
        title = "Todos"
        
        // Fetch from CoreData
        fetchData()
        
        // register the UITableViewCell class with the TableView
        // Dequeue with the reuse identifier
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    // MARK: UITTableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        // Regular way
//        cell.textLabel!.text = items[indexPath.row]
        
        // CoreData way
        let item = items[indexPath.row]
        cell.textLabel?.text = item.valueForKey("name") as? String
        return cell
    }

    // MARK: IBAction
    
    // Allow the user to enter an item in an alert view
    @IBAction func addItem(sender: AnyObject) {
        
        // Create an alert view
        var alert = UIAlertController(title: "New Item", message: "Add a new item", preferredStyle: .Alert)
        
        // Create a save action
        let saveAction = UIAlertAction(title: "Save", style: .Default) {
            (action) -> Void in
            // Add the item from the first textfield in the alert view to the self.items array
            let textField = alert.textFields![0] as! UITextField
            
            self.saveItem(textField.text)
            // Reload the table view when a new item is loaded
            self.tableView.reloadData()
        }
        // Create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        // Add the textfield and two above actions
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        // present the alert view
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: Helper Methods
    func saveItem(name: NSObject) {
        // Retrieve the managed object context in the app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        // Add an item to the managed context
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        // set the value for the item
        item.setValue(name, forKey: "name")
        
        // Save the managed object context back
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        // Add the new item to local items data source
        items.append(item)
        
    }
    
    func fetchData() {
        // Get managed object context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        // Create a fetch request into CoreData
        let fetchRequest = NSFetchRequest(entityName: "Item")
        
        // Execute the fetch request
        var error: NSError?
        
        if let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as! [NSManagedObject]? {
            // fetchedResults is not nil
            items = fetchedResults
        } else {
            println("Could not fetch \(error), \(error?.userInfo)")
        }
        
    }
}






















