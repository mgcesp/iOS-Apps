//
//  ViewController.swift
//  NavigationBars
//
//  Created by Manuel Cespedes on 6/24/15.
//  Copyright (c) 2015 9stack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // an object to control the time
    var timer = NSTimer()
    
    var count = 0
    
    // prints result
    func result(){
        
        count++
        println(count)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // selector: link to a function, everytime timer ticks
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

