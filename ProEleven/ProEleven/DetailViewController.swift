//
//  ViewController.swift
//  ProEleven
//
//  Created by Manuel Cespedes on 9/29/15.
//  Copyright © 2015 DevBros. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var playerImage: UIImageView!
    
    // Create variables to display in edit mode
    var nameEdit: String = ""
    var avatarEdit: UIImage?
    var playerToEdit: NSManagedObject!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        
        if playerToEdit != nil {
            nameTextField.text = nameEdit
            playerImage.image = avatarEdit
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**********************************************************/
    // MARK: UITextFieldDelegate
    
    // Gets called when user taps return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
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
        playerImage.image = selectedImage
        // Dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Actions
    @IBAction func save(sender: UIButton) {
        // Reference delegate
        let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Reference data
        let theContext: NSManagedObjectContext = delegate.managedObjectContext
        // Reference entity
        let theEntity = NSEntityDescription.entityForName("Players", inManagedObjectContext: theContext)
        
        // If iten exists then update it
        if playerToEdit != nil {
            playerToEdit?.setValue(nameTextField.text as String?, forKey: "name")
            let data = UIImageJPEGRepresentation(playerImage.image!, 1)
            playerToEdit.setValue(data, forKey: "avatar")
        }
        else {
            // Reference new model to insert
            let newPlayer = PlayerModel(entity: theEntity!, insertIntoManagedObjectContext: theContext)
            // Update the new model's attributes
            newPlayer.name = nameTextField.text!
            newPlayer.avatar = UIImageJPEGRepresentation(playerImage.image!, 1)!
        }
        
        do {
            try theContext.save()
        } catch _ {
            
        }
        
        // Dismiss navigation controller
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        // Create a UIImagePickerController
        let imagePickerController = UIImagePickerController()
        // Select source for image picker; only photo library
        imagePickerController.sourceType = .PhotoLibrary
        // Set image picker's delegate to this view controller
        imagePickerController.delegate = self
        // Present the image picker
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
}

