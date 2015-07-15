//
//  ViewController.swift
//  transitions
//
//  Created by Manuel Cespedes on 7/15/15.
//  Copyright (c) 2015 9stack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushViewController(sender: AnyObject) {
        // get the Main view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // set variable for second view controller
        var secondVC = SecondViewController()
        
        secondVC = storyboard.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    @IBAction func presentViewController(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var secondVC = SecondViewController()
        
        secondVC = storyboard.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        
        self.navigationController?.presentViewController(secondVC, animated: true, completion: nil)
    }

    @IBAction func popViewController(sender: AnyObject) {
        
        var secondVC = SecondViewController();
        
        secondVC.modalPresentationStyle = .Popover
        
        secondVC.preferredContentSize = CGSizeMake(300, 150)
        
        secondVC.view.backgroundColor = UIColor.purpleColor()
        
        let popoverPresentationViewController = secondVC.popoverPresentationController
        
        popoverPresentationViewController?.delegate = self
        
        popoverPresentationViewController?.permittedArrowDirections = .Up
        
        popoverPresentationViewController?.sourceView = sender as! UIView
        
        self.navigationController?.presentViewController(secondVC, animated: true, completion: nil)
        
    }
    
    // UIPopoverPresentationDelegate method
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!, traitCollection: UITraitCollection!) -> UIModalPresentationStyle {
        return .None
    }
}

