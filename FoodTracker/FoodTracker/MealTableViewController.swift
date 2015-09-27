//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Manuel Cespedes on 9/26/15.
//  Copyright © 2015 DevBros. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    // MARK: Properties
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller
        navigationItem.leftBarButtonItem = editButtonItem()
        
        // Load sample data
        loadSampleMeals()
    }
    
    // Helper to load sample data to view
    func loadSampleMeals() {
        
        let photo1 = UIImage(named: "meal1")!
        let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "meal2")!
        let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "meal3")!
        let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3)!
        
        meals += [meal1, meal2, meal3]
        
    }
    
    /**********************************************************/
    // MARK: UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Create constant with the identifier used in the storyboard
        let cellIdentifier = "MealTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        
        // Get the proper meal for the data source layout
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be editable
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Remove the meal object to be deleted from meals
            meals.removeAtIndex(indexPath.row)
            // Delete the corresponding row from the table view
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    /**********************************************************/
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDetail" {
            // Try to downcast the destination controller 
            let mealDetailViewController = segue.destinationViewController as! MealViewController
            
            // Get cell that triggered this segue
            if let selectedMealCell = sender as? MealTableViewCell {
                // Get cell location
                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                // Get meal from location
                let selectedMeal = meals[indexPath.row]
                // Assign the retieved meal to the meal property of the destination view controller
                mealDetailViewController.meal = selectedMeal
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new meal")
        }
    }

    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        
        // Try to downcast the source view controller to type MealViewController
        // If downcast is successful assign the view controller to a local constant
        if let sourceViewController = sender.sourceViewController as? MealViewController, meal = sourceViewController.meal {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update existing meal
                
                // Update the appropriate index in meals with the updated info
                meals[selectedIndexPath.row] = meal
                // Reload the row to display the changed data
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            
            else {
                // Add a new meal
                
                // Get the location of the table view where the new cell representing the new meal will be inserted
                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
                // Add the new meal to the array meals
                meals.append(meal)
                // Insert new row to the table; the animation option shows the inserted row slide from the bottom
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                
            }
        }
    }

}









