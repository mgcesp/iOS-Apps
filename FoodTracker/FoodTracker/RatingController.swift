//
//  RatingController.swift
//  FoodTracker
//
//  Created by Manuel Cespedes on 9/26/15.
//  Copyright © 2015 DevBros. All rights reserved.
//

import UIKit

class RatingController: UIView {
    
    // MARK: Properties
    
    var rating = 0 {
        // Gets called every time rating's value changes
        didSet {
            // Triggers a layout update
            // ensures the view is showing an accurate representation of rating
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    
    var spacing = 5
    
    var stars = 5
    
    /**********************************************************/
    // MARK: Initialization
    
    // Initialize this class for use
    required init?(coder aDecoder: NSCoder) {
        // Call superclass initializer
        super.init(coder: aDecoder)
        
        // Create images variables
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        // Create five buttons using a for loop
        // use half-open range operator (..<) doesn't include the upper num; range is 0 to 4
        for _ in 0..<stars {
            // Create a UI button with frame
            let button = UIButton()
            
            // Set images for states
            button.setImage(emptyStarImage, forState: .Normal) // Button is unselected
            button.setImage(filledStarImage, forState: .Selected) // Button is selected
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected]) // User is in the process of tapping the button
            
            // Dont show additional highlight during state change
            button.adjustsImageWhenHighlighted = false
            
            // Add target action to button which will be triggered when .TouchDown occurs
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            // Add new button to array
            ratingButtons += [button]
            // Add button to view
            addSubview(button)
        }
    }
    
    // Gives UIView subclasses a chance to perform a precise layout of their subviews
    // gets called at an appropiate time?
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing
        // enumerate returns a collection that contains elements paired with their indexes
        for (index, button) in ratingButtons.enumerate() {
            // use the index var to compute a new location for the button
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            // set button frame to new location
            button.frame = buttonFrame
        }
        
        // Update states
        updateButtonSelectionStates()
    }
    
    // Provide intrinsic content size; make sure it matches the size specified in the IB
    override func intrinsicContentSize() -> CGSize {
        
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    /**********************************************************/
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        // Get the index of the selected button
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
    }
    // Helper to update the state of the buttons
    func updateButtonSelectionStates() {
        // Traverse the array
        for (index, button) in ratingButtons.enumerate() {
            // A button is selected if its index is less than the rating
            button.selected = index < rating
        }
    }
    
}
































