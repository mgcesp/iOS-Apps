//
//  ViewController.swift
//  cubanTranslator
//
//  Created by Manuel Cespedes on 6/25/15.
//  Copyright (c) 2015 9stack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // runs after the app is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // runs when memory warnings appear
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var textbox: UITextField!
    
    @IBOutlet var result: UILabel!
    
    @IBAction func translate(sender: AnyObject) {
        
        if (textbox.text == "be quiet") {
            result.text = "Callate coño!"
        }
        else {
            result.text = "Que bola hacere!"
        }
        
    }
    

}

