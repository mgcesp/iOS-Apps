//
//  Meal.swift
//  FoodTracker
//
//  Created by Manuel Cespedes on 9/26/15.
//  Copyright © 2015 DevBros. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    
    // Make them with var because they'll need to change throughout the lifetime of a Meal object
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Check for incorrect values
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
}
