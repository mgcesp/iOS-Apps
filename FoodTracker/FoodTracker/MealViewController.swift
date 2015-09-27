//
//  ViewController.swift
//  FoodTracker
//
//  Created by Manuel Cespedes on 9/26/15.
//  Copyright © 2015 DevBros. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingController!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make this viewcontroller the delegate of the text field
        nameTextField.delegate = self
        
        // Set up IB outlets if editing an existing meal
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        // Enable the save button only if the text field has a valid Meal name
        checkValidMealName()
    }
    
    /**********************************************************/
    // MARK: UITextFieldDelegate
    
    // Gets called when user taps return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    // Called after textfield resigns first responder
    // Gives access to the text entered in the field
    func textFieldDidEndEditing(textField: UITextField) {
        // Check if the text field has text in it
        checkValidMealName()
        // Set the title of the scene to that text
        navigationItem.title = textField.text
    }
    // Gets called when an editing session begins or when keyboard is displayed
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the save button while editing
        saveButton.enabled = false
    }
    
    // Helper method
    func checkValidMealName() {
        // Disable the save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
        
    }
    
    /**********************************************************/
    // MARK: UIImagePickerControllerDelegate
    
    // Gets called when user taps cancel button
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss picker if user cancels
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Gets called when user selects a photo
    // Gives us a chance to do something with the image selected from the picker
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //  Get the original image selected from the dictionary info
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        // Set UI outlet with the selected image
        photoImageView.image = selectedImage
        // Dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**********************************************************/
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        // Boolean to check if the current scene was presented modally
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        // If current scene was presented with modally (using the add button)
        if isPresentingInAddMealMode {
            // Dismiss meal scene without storing any information
            dismissViewControllerAnimated(true, completion: nil)
        }
        // Else current scene was presented with push navigation (using a table view cell)
        else {
            // Pop the current view controller (meal scene) off the navigation stack
            navigationController!.popViewControllerAnimated(true)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Check that the object referenced by the saveButton outlet is the same object instance as the sender
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            // Set the meal to be passed to MealTableViewController
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    /**********************************************************/
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        // Create a UIImagePickerController 
        let imagePickerController = UIImagePickerController()
        // Select source of image picker; only photo library
        imagePickerController.sourceType = .PhotoLibrary
        // Set image picker's delegate to this view controller
        imagePickerController.delegate = self
        // Present the image picker
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
}

