//
//  ViewController.swift
//  TicTacToe
//
//  Created by Manuel Cespedes on 8/10/15.
//  Copyright (c) 2015 9stack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = nought ; 2 = cross
    var activePlayer = 1
    
    // game is active
    var gameActive = true
    
    // represents the board
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // represents all the winning combinations
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        resetGame()
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        // if space is available
        if gameState[sender.tag] == 0 && gameActive == true {
            
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                image = UIImage(named: "cross.png")! // using ! force unwraps it
                
                activePlayer = 2 // next players turn
            }
            else {
                image = UIImage(named: "circle.png")!
                
                activePlayer = 1
            }
            
            // sender is the UI element that was tapped
            sender.setImage(image, forState: .Normal)
            
            checkWinner()
        }
    }
    
    func checkWinner() {
        for combination in winningCombinations {
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                var labelText = ""
                
                if gameState[combination[0]] == 1 {
                    labelText = "Crosses win!"
                } else {
                    labelText = "Circles win!"
                }
                
                winnerLabel.text = labelText
                
                showGameOverElements()
                
                gameActive = false
            }
        }
    }
    
    func hideGameOverElements() {
        
        winnerLabel.hidden = true
        playAgainButton.hidden = true
        
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 400, winnerLabel.center.y)
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }
    
    func showGameOverElements() {
        
        winnerLabel.hidden = false
        playAgainButton.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 400, self.winnerLabel.center.y)
            
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
        })
    }
    
    func resetGame() {
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button : UIButton
        
        // reset button images
        for var i = 0; i < 9; i++ {
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        hideGameOverElements()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideGameOverElements()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

