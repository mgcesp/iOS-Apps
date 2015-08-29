//
//  ViewController.swift
//  Calculator
//
//  Created by Manuel Cespedes on 4/17/15.
//  Copyright (c) 2015 mcfresh. All rights reserved.
//

import UIKit

// inherit from UIViewController
class ViewController: UIViewController {

//    property: instance variable
    
    @IBOutlet weak var display: UILabel!
    
    var userIsTyping: Bool = false
    
    var brain = CalculatorBrain();
    
    //    sends a digit
    @IBAction func appendDigit(sender: UIButton) {
        // let is same as var but a constant
        let digit = sender.currentTitle!
        
        if userIsTyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
        
        println( "digit = \(digit)")
    }

    @IBAction func clear(sender: UIButton) {
        display.text = "0"
        userIsTyping = false
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsTyping {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    @IBAction func enter() {
        userIsTyping = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result //make displayValue an optional
        } else {
            displayValue = 0
        }
        
    }
    
    // computed property :
    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            // newValue is what?
            display.text = "\(newValue)"
            userIsTyping = false
        }
    }
}

