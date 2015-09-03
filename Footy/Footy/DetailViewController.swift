//
//  DetailViewController.swift
//  Footy
//
//  Created by Manuel Cespedes on 8/28/15.
//  Copyright (c) 2015 DevBros. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var player: Player?
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerName.text = player?.name
        playerPosition.text = player?.position
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
