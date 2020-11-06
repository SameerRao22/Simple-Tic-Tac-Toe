//
//  ViewController.swift
//  tic tac toe
//
//  Created by snr on 9/30/20.
//  Copyright © 2020 SameerRao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var spaces = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var xWinsCount = 0
    var oWinsCount = 0
    var winCases = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var player = 1
    var validGame = true
    var gamesPlayed = 0
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var xWins: UILabel!
    @IBOutlet weak var oWins: UILabel!
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        if (spaces[sender.tag] == 0 && validGame) {
            if (player == 1) {
                sender.setImage(UIImage(named: "X.png"), for: UIControl.State())
                player = 2
                spaces[sender.tag] = 1
            } else {
                sender.setImage(UIImage(named: "O.png"), for: UIControl.State())
                player = 1
                spaces[sender.tag] = 2
            }
        }
        
        for i in winCases {
            if ((spaces[i[0]] != 0) && (spaces[i[0]] == spaces[i[1]]) && (spaces[i[1]] == spaces[i[2]])) {
                validGame = false
                
                if spaces[i[0]] == 1 {
                    xWinsCount += 1
                    label.textColor = UIColor.red
                    label.text = "X Has Won!"
                }
                else if spaces[i[0]] == 2 {
                    oWinsCount += 1
                    label.textColor = UIColor.blue
                    label.text = "O Has Won!"
                }
                label.isHidden = false
                playAgainButton.isHidden = false
                xWins.text = "X Wins: \(xWinsCount)"
                oWins.text = "O Wins: \(oWinsCount)"
            }
        }
        var emptyCounter = 0
        for x in spaces {
            if x == 0 {
                emptyCounter += 1
            }
        }
        if (emptyCounter == 0) && (validGame) {
            label.text = "Draw Game"
            label.textColor = UIColor.gray
            label.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    
    @IBAction func playAgainPushed(_ sender: UIButton) {
        gamesPlayed += 1
        if (gamesPlayed % 2 == 0) {
            player = 1
        } else {
            player = 2
        }
        label.isHidden = true
        sender.isHidden = true
        validGame = true
        
        spaces = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        button0.setImage(nil, for: UIControl.State())
        button1.setImage(nil, for: UIControl.State())
        button2.setImage(nil, for: UIControl.State())
        button3.setImage(nil, for: UIControl.State())
        button4.setImage(nil, for: UIControl.State())
        button5.setImage(nil, for: UIControl.State())
        button6.setImage(nil, for: UIControl.State())
        button7.setImage(nil, for: UIControl.State())
        button8.setImage(nil, for: UIControl.State())
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

