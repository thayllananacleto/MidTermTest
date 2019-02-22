//
//  GameScene.swift
//  MidTermTest
//
//  Created by Thayllan Anacleto on 2019-02-21.
//  Copyright © 2019 Thayllan Anacleto. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Utility Variables
    var jackpot = 5000
    var winnings = 0
    var turn = 0
    var winNumber = 0
    var lossNumber = 0
    var winRatio = Double(0)
    var itemsOut = false
    var isToad = true
    
    // Variable for result outcomes
    var boo = 0
    var mushroom = 0
    var flower = 0
    var leaf = 0
    var cherries = 0
    var coin = 0
    var star = 0
    var bowser = 0
    var betLine = [#imageLiteral(resourceName: "slot03"), #imageLiteral(resourceName: "slot03"), #imageLiteral(resourceName: "slot03")]
    
    // Outlets
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblCoins: UILabel!
    @IBOutlet weak var lblBetCoins: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var block1: UIImageView!
    @IBOutlet weak var block2: UIImageView!
    @IBOutlet weak var block3: UIImageView!
    @IBOutlet weak var item1: UIImageView!
    @IBOutlet weak var item2: UIImageView!
    @IBOutlet weak var item3: UIImageView!
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var btnSpin: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var lblJackpot: UILabel!
    @IBOutlet weak var lblPlayerStats: UILabel!
    
    // Declaring all the assets
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width * 0.01, y: self.size.height * 0.05)
        background.setScale(0.8)
        background.zPosition = 0
        self.addChild(background)
        
        let logo = SKSpriteNode(imageNamed: "Logo")
        logo.position = CGPoint(x: self.size.width * 0.001, y: self.size.height * 0.3)
        logo.setScale(0.55)
        logo.zPosition = 1
        self.addChild(logo)
        
        let resultsLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        resultsLabel.text = "W: 0      L: 0      WR: 0.0%      T: 0"
        resultsLabel.fontSize = 30
        resultsLabel.fontColor = SKColor.white
        resultsLabel.position = CGPoint(x: self.size.width * 0.1, y: self.size.height * 0.2)
        resultsLabel.zPosition = 1
        self.addChild(resultsLabel)
        
        let coin = SKSpriteNode(imageNamed: "Coin_-_New_Super_Mario_Bros")
        coin.position = CGPoint(x: self.size.width * -0.43, y: self.size.height * 0.12)
        coin.setScale(0.03)
        coin.zPosition = 1
        self.addChild(coin)
        
        let coinLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        coinLabel.text = "x01"
        coinLabel.fontSize = 35
        coinLabel.fontColor = SKColor.white
        coinLabel.position = CGPoint(x: self.size.width * -0.35, y: self.size.height * 0.11)
        coinLabel.zPosition = 1
        self.addChild(coinLabel)
        
        let jackpotLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        jackpotLabel.text = "Jackpot: 5000"
        jackpotLabel.fontSize = 35
        jackpotLabel.fontColor = SKColor.white
        jackpotLabel.position = CGPoint(x: self.size.width * 0.31, y: self.size.height * 0.11)
        jackpotLabel.zPosition = 1
        self.addChild(jackpotLabel)
        
        let block1 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block1.position = CGPoint(x: self.size.width * -0.35, y: self.size.height * -0.13)
        block1.setScale(0.13)
        block1.zPosition = 1
        self.addChild(block1)
        
        let block2 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block2.position = CGPoint(x: self.size.width * 0.001, y: self.size.height * -0.13)
        block2.setScale(0.13)
        block2.zPosition = 1
        self.addChild(block2)
        
        let block3 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block3.position = CGPoint(x: self.size.width * 0.35, y: self.size.height * -0.13)
        block3.setScale(0.13)
        block3.zPosition = 1
        self.addChild(block3)
        
        let toad = SKSpriteNode(imageNamed: "toad")
        toad.position = CGPoint(x: self.size.width * -0.35, y: self.size.height * -0.3)
        toad.setScale(0.13)
        toad.zPosition = 1
        self.addChild(toad)
        
        let speechBalloon = SKSpriteNode(imageNamed: "1265px-Speech_balloon.svg")
        speechBalloon.position = CGPoint(x: self.size.width * 0.06, y: self.size.height * -0.28)
        speechBalloon.size = CGSize(width: 480, height: 200)
        speechBalloon.zPosition = 1
        self.addChild(speechBalloon)
        
        let messageLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
        messageLabel.text = "GOOD LUCK!"
        messageLabel.fontSize = 35
        messageLabel.fontColor = SKColor.blue
        messageLabel.position = CGPoint(x: self.size.width * 0.06, y: self.size.height * -0.28)
        messageLabel.zPosition = 1
        self.addChild(messageLabel)
        
        let oneUp = SKSpriteNode(imageNamed: "1up")
        oneUp.position = CGPoint(x: self.size.width * -0.35, y: self.size.height * -0.45)
        oneUp.setScale(0.06)
        oneUp.zPosition = 1
        self.addChild(oneUp)
        
        let pow = SKSpriteNode(imageNamed: "POW_Block_-_New_Super_Mario_Bros_Wii")
        pow.position = CGPoint(x: self.size.width * 0.35, y: self.size.height * -0.44)
        pow.setScale(0.06)
        pow.zPosition = 1
        self.addChild(pow)
        
        let betLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        betLabel.text = "Bet x10"
        betLabel.fontSize = 35
        betLabel.fontColor = SKColor.white
        betLabel.position = CGPoint(x: self.size.width * 0.01, y: self.size.height * -0.44)
        betLabel.zPosition = 1
        self.addChild(betLabel)
        
    }
    
    @IBAction func btnSpinAction(_ sender: UIButton) {
        
        //        btnReset.isEnabled = false
        btnSpin.isEnabled = false
        //        stepper.isEnabled = false
        
        if itemsOut {
            self.item1.frame.origin.y += 87
            self.item2.frame.origin.y += 87
            self.item3.frame.origin.y += 87
        }
        
        Reels()
        
        turn = turn + 1
        itemsOut = true
        block1.image = #imageLiteral(resourceName: "Used")
        block2.image = #imageLiteral(resourceName: "Used")
        block3.image = #imageLiteral(resourceName: "Used")
        item1.image = betLine[0]
        item2.image = betLine[1]
        item3.image = betLine[2]
        Model.instance.playSound(sound: Constant.smw_vine)
        UIView.animate(withDuration: 1, animations: {self.item1.frame.origin.y -= 87}, completion: nil)
        UIView.animate(withDuration: 1, animations: {self.item2.frame.origin.y -= 87}, completion: nil)
        UIView.animate(withDuration: 1, animations: {self.item3.frame.origin.y -= 87}, completion: {(finished:Bool) in
            self.determineWinnings()
            self.updatePlayerStatus()
            
            //            self.btnReset.isEnabled = true
            self.btnSpin.isEnabled = true
            //            self.stepper.isEnabled = true
        })
        
    }
    
    /* Utility function to check if a value falls within a range of bounds */
    func checkRange(value: Int, lowerBounds: Int, upperBounds: Int) -> Int {
        if (value >= lowerBounds && value <= upperBounds) {
            return value
        }
        else {
            return 0
        }
    }
    
    /* When this function is called it determines the betLine results. */
    func Reels() {
        
        var outCome = [0, 0, 0]
        
        for spin in 0...2 {
            //outCome[spin] = Math.floor((Math.random() * 65) + 1)
            outCome[spin] = Int(arc4random_uniform(UInt32(8 * 8))) + 3
            switch (outCome[spin]) {
            case checkRange(value: spin, lowerBounds: 1, upperBounds: 27):
                bowser = bowser + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):
                betLine[spin] = #imageLiteral(resourceName: "slot08")
                bowser = bowser + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37):
                betLine[spin] = #imageLiteral(resourceName: "slot07")
                boo = boo + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46):
                betLine[spin] = #imageLiteral(resourceName: "slot03")
                mushroom = mushroom + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54):
                betLine[spin] = #imageLiteral(resourceName: "slot04")
                flower = flower + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59):
                betLine[spin] = #imageLiteral(resourceName: "slot02")
                leaf = leaf + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62):
                betLine[spin] = #imageLiteral(resourceName: "slot05")
                cherries = cherries + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64):
                betLine[spin] = #imageLiteral(resourceName: "slot06")
                coin = coin + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65):
                betLine[spin] = #imageLiteral(resourceName: "slot01")
                star = star + 1
                break
            default:
                break
            }
        }
    }
    
    /* This function calculates the player's winnings, if any */
    func determineWinnings() {
        if (bowser == 0) {
            if (boo == 3) {
                winnings = betCoins * 10
            }
            else if(mushroom == 3) {
                winnings = betCoins * 20
            }
            else if (flower == 3) {
                winnings = betCoins * 30
            }
            else if (leaf == 3) {
                winnings = betCoins * 40
            }
            else if (cherries == 3) {
                winnings = betCoins * 50
            }
            else if (coin == 3) {
                winnings = betCoins * 75
            }
            else if (star == 3) {
                winnings = betCoins * 100
            }
            else if (boo == 2) {
                winnings = betCoins * 2
            }
            else if (mushroom == 2) {
                winnings = betCoins * 2
            }
            else if (flower == 2) {
                winnings = betCoins * 3
            }
            else if (leaf == 2) {
                winnings = betCoins * 4
            }
            else if (cherries == 2) {
                winnings = betCoins * 5
            }
            else if (coin == 2) {
                winnings = betCoins * 10
            }
            else if (star == 2) {
                winnings = betCoins * 20
            }
            else if (star == 1) {
                winnings = betCoins * 5
            }
            else {
                winnings = betCoins * 1
            }
            
            winNumber = winNumber + 1
            Model.instance.playSound(sound: Constant.smw_1up)
            showWinMessage()
            
        } else {
            
            lossNumber = lossNumber + 1
            Model.instance.playSound(sound: Constant.smw_spring_jump)
            showLossMessage()
        }
        
        // if cash is over
        if currentCoins <= 0 {
            //gameOver()
        } else{  // update bet stepper
            if Int(stepper.value) > currentCoins {
                stepper.maximumValue = Double(currentCoins)
                lblBetCoins.text = "Bet x\(currentCoins)"
                stepper.value = Double(currentCoins)
            }
        }
        
    }
    
    /* Utility function to show a win message and increase player money */
    func showWinMessage() {
        Model.instance.updateCoins(label: lblCoins, coins: (currentCoins + winnings))
        lblMessage.text = "YOU WON $\(winnings)"
        resetResultOutcomes()
        //checkJackPot()
    }
    
    /* Utility function to show a loss message and reduce player money */
    func showLossMessage() {
        Model.instance.updateCoins(label: lblCoins, coins: (currentCoins - betCoins))
        lblMessage.text = "TRY AGAIN..."
        resetResultOutcomes()
    }
    
    func updatePlayerStatus() {
        if turn > 0 {
            winRatio = (Double(winNumber) / Double(turn))
        }
        lblPlayerStats.text = "W: \(winNumber)      L: \(lossNumber)      WR: \(round((winRatio * 100)))%      T: \(turn)"
    }
    
    @IBAction func stepperAction(_ sender: UIStepper){
        stepper.maximumValue = Double(currentCoins)
        let amount = Int(sender.value)
        if currentCoins >= amount {
            betCoins = amount
            lblBetCoins.text = "Bet x\(amount)"
        }
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        startSlothMachine()
//        Model.instance.playSound(sound: Constant.overworld)
//    }
    
    func startSlothMachine(){
        if Model.instance.isFirstTime(){
            Model.instance.updateCoins(label: lblCoins, coins: 1000)
        } else {
            lblCoins.text = "x\(Model.instance.getLatestCoins())"
        }
        
        stepper.maximumValue = Double(currentCoins)
        //betCoins = Int(stepper.value)
    }
    
    // Return current coins and remove the 'x' string
    var currentCoins : Int{
        guard let coins = lblCoins.text, !(lblCoins.text?.isEmpty)! else {
            return 0
        }
        return Int(coins.replacingOccurrences(of: "x", with: ""))!
    }
    
    // Bet coins
    var betCoins : Int = 10 {
        didSet {
            lblBetCoins.text = "Bet x\(currentCoins)"
        }
    }
    
    /* Check to see if the player won the jackpot */
//    func checkJackPot() {
//        /* compare two random values */
//        //var jackPotTry = Math.floor(Math.random() * 51 + 1)
//        //var jackPotWin = Math.floor(Math.random() * 51 + 1)
//        //        let jackPotTry = 1
//        //        let jackPotWin = 1
//        let jackPotTry = Int(arc4random_uniform(UInt32(51))) + 1
//        let jackPotWin = Int(arc4random_uniform(UInt32(51))) + 1
//        if (jackPotTry == jackPotWin) {
//            Model.instance.playSound(sound: Constant.star_theme)
//            let alert = UIAlertController(title: "JACKPOT!!", message: "You won the $\(jackpot) Jackpot!!", preferredStyle: .alert)
//            alert.addAction( UIAlertAction(title: "OK", style: .default, handler: { (_) in
//                Model.instance.updateCoins(label: self.lblCoins, coins: (self.currentCoins + self.jackpot))
//                self.jackpot = 1000
//                self.lblJackpot.text = "Jackpot: \(self.jackpot)"
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
    
    // Show Game Over alert and restart the game
//    func gameOver(){
//        Model.instance.playSound(sound: Constant.smw_game_over)
//        let alert = UIAlertController(title: "Game Over", message: "You are out of coins! \nPlay Again?", preferredStyle: .alert)
//        alert.addAction( UIAlertAction(title: "OK", style: .default, handler: { (_) in
//            self.startSlothMachine()
//        }))
//        self.present(alert, animated: true, completion: nil)
//        self.resetResultOutcomes()
//        self.resetPlayerStats()
//    }
    
    // Function responsible for resetting the whole game
    @IBAction func resetGame(_ sender: UIButton) {
        
        btnReset.isEnabled = false
        btnSpin.isEnabled = false
        stepper.isEnabled = false
        
        Model.instance.playSound(sound: Constant.smw_bonus_game_end)
        
        //        UIView.animate(withDuration: 3, animations: {self.imgToad.frame.origin.x += 30}, completion: nil)
        UIView.animate(withDuration: 4, animations: {self.imgCharacter.frame.origin.x -= 200}, completion: {(finished:Bool) in
            Model.instance.playSound(sound: Constant.overworld)
            
            if self.itemsOut {
                self.item1.frame.origin.y += 87
                self.item2.frame.origin.y += 87
                self.item3.frame.origin.y += 87
                self.itemsOut = false
            }
            
            self.block1.image = #imageLiteral(resourceName: "Question_Block_Art_-_New_Super_Mario_Bros")
            self.block2.image = #imageLiteral(resourceName: "Question_Block_Art_-_New_Super_Mario_Bros")
            self.block3.image = #imageLiteral(resourceName: "Question_Block_Art_-_New_Super_Mario_Bros")
            self.lblMessage.text = "GOOD LUCK!"
            
            Model.instance.deletePreviousSave()
            self.startSlothMachine()
            self.resetResultOutcomes()
            self.resetPlayerStats()
            
            self.changeCharacter()
            UIView.animate(withDuration: 4, animations: {self.imgCharacter.frame.origin.x += 200}, completion: {(finished:Bool) in
                self.btnReset.isEnabled = true
                self.btnSpin.isEnabled = true
                self.stepper.isEnabled = true
            })
        })
    }
    
    func changeCharacter() {
        if isToad {
            self.imgCharacter.image = #imageLiteral(resourceName: "195px-NewSuperMarioBrosUDeluxe_Toadette")
            lblMessage.textColor = UIColor.purple
            isToad = false
        } else {
            self.imgCharacter.image = #imageLiteral(resourceName: "toad")
            lblMessage.textColor = UIColor.blue
            isToad = true
        }
    }
    
    /* Utility function to reset all the previous result outcomes */
    func resetResultOutcomes() {
        boo = 0
        mushroom = 0
        flower = 0
        leaf = 0
        cherries = 0
        coin = 0
        star = 0
        bowser = 0
    }
    
    /* Utility function to reset the player stats */
    func resetPlayerStats() {
        jackpot = 5000
        lblJackpot.text = "Jackpot: \(jackpot)"
        winnings = 0
        turn = 0
        winNumber = 0
        lossNumber = 0
        winRatio = 0
        updatePlayerStatus()
    }
}
