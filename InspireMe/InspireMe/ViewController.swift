//
//  ViewController.swift
//  InspireMe
//
//  Created by Manuel Cespedes on 9/27/15.
//  Copyright © 2015 DevBros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var quoteLabel: UILabel!
    
    var quoteArray = ["You can't use up creativity. The more you use, the more you have.", "Believe you can and you're halfway there.", "A goal without a plan is only a wish.", "Don't just wait for inspiration. Become it.", "Bravery is the solution to regret"]
    
    var numberQuote = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func getQuoteButton(sender: UIButton) {
        selectQuote()
    }
    
    func selectQuote() {
        
        numberQuote = Int(arc4random_uniform(5))
        
        printQuote()
    }
    
    func printQuote() {
        quoteLabel.text = "\(quoteArray[numberQuote])"
    }
}

