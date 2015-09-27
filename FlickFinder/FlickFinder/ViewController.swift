//
//  ViewController.swift
//  FlickFinder
//
//  Created by Manuel Cespedes on 9/2/15.
//  Copyright (c) 2015 DevBros. All rights reserved.
//

import UIKit

// MARK: Constants
let BASE_URL = "https://api.flickr.com/services/rest/"
let METHOD_NAME = "flickr.galleries.getPhotos"
let API_KEY = "beb5c04039c71bad22e93187a598b0a2"
let EXTRAS = "url_m"
let SAFE_SEARCH = "1"
let DATA_FORM = "json"
let NO_JSON_CALLBACK = "1"

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var phraseText: UITextField!
    @IBOutlet weak var latitudeText: UITextField!
    @IBOutlet weak var longitudeText: UITextField!
    @IBOutlet weak var imageTitle: UILabel!
    
    // MARK: Variables
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: IBActions
    @IBAction func searchPhrase(sender: AnyObject) {
    }

    @IBAction func searchLocation(sender: AnyObject) {
    }
    
    // Helper Functions
    func getImageFromFlickr() {
        
    }
    
}

