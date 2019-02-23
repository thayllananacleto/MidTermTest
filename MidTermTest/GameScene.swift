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
    var betLine = ["slot01", "slot02", "slot03"]
    
    var blocks1 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    var blocks2 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    var blocks3 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    var result1 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    var result2 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    var result3 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    var resultsLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
    var coinLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
    var jackpotLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
    var messageLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
    var oneUp = SKSpriteNode(imageNamed: "1up")
    var pow = SKSpriteNode(imageNamed: "POW_Block_-_New_Super_Mario_Bros_Wii")
    var betLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
    
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
        
        resultsLabel.text = "W: 0      L: 0      WR: 0.0%      T: 0"
        resultsLabel.fontSize = 28
        resultsLabel.fontColor = SKColor.white
        resultsLabel.position = CGPoint(x: self.size.width * 0.1, y: self.size.height * 0.2)
        resultsLabel.zPosition = 1
        self.addChild(resultsLabel)
        
        let coin = SKSpriteNode(imageNamed: "Coin_-_New_Super_Mario_Bros")
        coin.position = CGPoint(x: self.size.width * -0.43, y: self.size.height * 0.12)
        coin.setScale(0.03)
        coin.zPosition = 1
        self.addChild(coin)
        
        coinLabel.text = "x1000"
        coinLabel.fontSize = 35
        coinLabel.fontColor = SKColor.white
        coinLabel.position = CGPoint(x: self.size.width * -0.33, y: self.size.height * 0.11)
        coinLabel.zPosition = 1
        self.addChild(coinLabel)
        
        jackpotLabel.text = "Jackpot: 5000"
        jackpotLabel.fontSize = 35
        jackpotLabel.fontColor = SKColor.white
        jackpotLabel.position = CGPoint(x: self.size.width * 0.31, y: self.size.height * 0.11)
        jackpotLabel.zPosition = 1
        self.addChild(jackpotLabel)
        
        blocks1.position = CGPoint(x: self.size.width * -0.35, y: self.size.height * -0.13)
        blocks1.setScale(0.13)
        blocks1.zPosition = 2
        self.addChild(blocks1)
        
        blocks2.position = CGPoint(x: self.size.width * 0.001, y: self.size.height * -0.13)
        blocks2.setScale(0.13)
        blocks2.zPosition = 2
        self.addChild(blocks2)
        
        blocks3.position = CGPoint(x: self.size.width * 0.35, y: self.size.height * -0.13)
        blocks3.setScale(0.13)
        blocks3.zPosition = 2
        self.addChild(blocks3)
        
        result1.position = CGPoint(x: self.size.width * -0.35, y: self.size.height * -0.13)
        result1.setScale(0.13)
        result1.zPosition = 1
        self.addChild(result1)
        
        result2.position = CGPoint(x: self.size.width * 0.001, y: self.size.height * -0.13)
        result2.setScale(0.13)
        result2.zPosition = 1
        self.addChild(result2)
        
        result3.position = CGPoint(x: self.size.width * 0.35, y: self.size.height * -0.13)
        result3.setScale(0.13)
        result3.zPosition = 1
        self.addChild(result3)
        
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
        
        messageLabel.text = "GOOD LUCK!"
        messageLabel.fontSize = 35
        messageLabel.fontColor = SKColor.blue
        messageLabel.position = CGPoint(x: self.size.width * 0.06, y: self.size.height * -0.28)
        messageLabel.zPosition = 2
        self.addChild(messageLabel)
    
        oneUp.position = CGPoint(x: self.size.width * -0.35, y: self.size.height * -0.45)
        oneUp.setScale(0.06)
        oneUp.zPosition = 1
        oneUp.name = "reset"
        self.addChild(oneUp)
        
        pow.position = CGPoint(x: self.size.width * 0.35, y: self.size.height * -0.44)
        pow.setScale(0.06)
        pow.zPosition = 1
        pow.name = "pow"
        self.addChild(pow)
        
        betLabel.text = "Bet x10"
        betLabel.fontSize = 45
        betLabel.fontColor = SKColor.white
        betLabel.position = CGPoint(x: self.size.width * 0.01, y: self.size.height * -0.44)
        betLabel.zPosition = 1
        self.addChild(betLabel)
        
        let minusLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        minusLabel.text = "-"
        minusLabel.fontSize = 90
        minusLabel.fontColor = SKColor.white
        minusLabel.position = CGPoint(x: self.size.width * -0.03, y: self.size.height * -0.49)
        minusLabel.zPosition = 1
        self.addChild(minusLabel)
        
        let plusLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        plusLabel.text = "+"
        plusLabel.fontSize = 70
        plusLabel.fontColor = SKColor.white
        plusLabel.position = CGPoint(x: self.size.width * 0.05, y: self.size.height * -0.48)
        plusLabel.zPosition = 1
        self.addChild(plusLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            
            if tappedNode.name == "pow" {
                
                if itemsOut {
                    let moveItemsOutOfTheBlock = SKAction.moveTo(y: self.size.height * -0.13, duration: 0)
                    let startGameSequence = SKAction.sequence([moveItemsOutOfTheBlock])
                    result1.run(startGameSequence)
                    result2.run(startGameSequence)
                    result3.run(startGameSequence)
                }
                
                Reels()
                
                turn = turn + 1
                itemsOut = true
                
                blocks1.texture = SKTexture(imageNamed: "Used")
                blocks2.texture = SKTexture(imageNamed: "Used")
                blocks3.texture = SKTexture(imageNamed: "Used")
                
                result1.texture = SKTexture(imageNamed: betLine[0])
                result2.texture = SKTexture(imageNamed: betLine[1])
                result3.texture = SKTexture(imageNamed: betLine[2])
                
                Model.instance.playSound(sound: Constant.smw_vine)
                
                let moveItemsOutOfTheBlock = SKAction.moveTo(y: self.size.height * 0.001, duration: 0.7)
                let startGameSequence = SKAction.sequence([moveItemsOutOfTheBlock])
                result1.run(startGameSequence)
                result2.run(startGameSequence)
                result3.run(startGameSequence)
                
                self.determineWinnings()
                self.updatePlayerStatus()
                
            }
            
            if tappedNode.name == "reset" {
                
                Model.instance.playSound(sound: Constant.smw_bonus_game_end)
                //Model.instance.playSound(sound: Constant.overworld)
                
                if self.itemsOut {
                    let moveItemsOutOfTheBlock = SKAction.moveTo(y: self.size.height * -0.13, duration: 0)
                    let startGameSequence = SKAction.sequence([moveItemsOutOfTheBlock])
                    result1.run(startGameSequence)
                    result2.run(startGameSequence)
                    result3.run(startGameSequence)
                    self.itemsOut = false
                }
                
                blocks1.texture = SKTexture(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
                blocks2.texture = SKTexture(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
                blocks3.texture = SKTexture(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
                messageLabel.text = "GOOD LUCK!"
                
                Model.instance.deletePreviousSave()
                self.startSlothMachine()
                self.resetResultOutcomes()
                self.resetPlayerStats()
                
            }
            
        }
        
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
                betLine[spin] = "slot08"
                bowser = bowser + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37):
                betLine[spin] = "slot07"
                boo = boo + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46):
                betLine[spin] = "slot03"
                mushroom = mushroom + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54):
                betLine[spin] = "slot04"
                flower = flower + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59):
                betLine[spin] = "slot02"
                leaf = leaf + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62):
                betLine[spin] = "slot05"
                cherries = cherries + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64):
                betLine[spin] = "slot06"
                coin = coin + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65):
                betLine[spin] = "slot01"
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
//            if Int(stepper.value) > currentCoins {
//                stepper.maximumValue = Double(currentCoins)
//                lblBetCoins.text = "Bet x\(currentCoins)"
//                stepper.value = Double(currentCoins)
//            }
        }
        
    }
    
    /* Utility function to show a win message and increase player money */
    func showWinMessage() {
        Model.instance.updateCoins(label: coinLabel, coins: (currentCoins + winnings))
        messageLabel.text = "YOU WON $\(winnings)"
        resetResultOutcomes()
        checkJackPot()
    }
    
    /* Utility function to show a loss message and reduce player money */
    func showLossMessage() {
        Model.instance.updateCoins(label: coinLabel, coins: (currentCoins - betCoins))
        messageLabel.text = "TRY AGAIN..."
        resetResultOutcomes()
    }
    
    func updatePlayerStatus() {
        if turn > 0 {
            winRatio = (Double(winNumber) / Double(turn))
        }
        resultsLabel.text = "W: \(winNumber)      L: \(lossNumber)      WR: \(round((winRatio * 100)))%      T: \(turn)"
    }
    
//    @IBAction func stepperAction(_ sender: UIStepper){
//        stepper.maximumValue = Double(currentCoins)
//        let amount = Int(sender.value)
//        if currentCoins >= amount {
//            betCoins = amount
//            lblBetCoins.text = "Bet x\(amount)"
//        }
//    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        startSlothMachine()
        Model.instance.playSound(sound: Constant.overworld)
    }
    
    func startSlothMachine(){
        if Model.instance.isFirstTime(){
            Model.instance.updateCoins(label: coinLabel, coins: 1000)
        } else {
            coinLabel.text = "x\(Model.instance.getLatestCoins())"
        }
        
//        stepper.maximumValue = Double(currentCoins)
        //betCoins = Int(stepper.value)
    }
    
    // Return current coins and remove the 'x' string
    var currentCoins : Int{
        guard let coins = coinLabel.text, !(coinLabel.text?.isEmpty)! else {
            return 0
        }
        return Int(coins.replacingOccurrences(of: "x", with: ""))!
    }
    
    // Bet coins
    var betCoins : Int = 10 {
        didSet {
            betLabel.text = "Bet x\(currentCoins)"
        }
    }
    
    /* Check to see if the player won the jackpot */
    func checkJackPot() {
        /* compare two random values */
        //var jackPotTry = Math.floor(Math.random() * 51 + 1)
        //var jackPotWin = Math.floor(Math.random() * 51 + 1)
        //        let jackPotTry = 1
        //        let jackPotWin = 1
        let jackPotTry = Int(arc4random_uniform(UInt32(51))) + 1
        let jackPotWin = Int(arc4random_uniform(UInt32(51))) + 1
        if (jackPotTry == jackPotWin) {
            Model.instance.playSound(sound: Constant.star_theme)
            let alert = UIAlertController(title: "JACKPOT!!", message: "You won the $\(jackpot) Jackpot!!", preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: "OK", style: .default, handler: { (_) in
                Model.instance.updateCoins(label: self.coinLabel, coins: (self.currentCoins + self.jackpot))
                self.jackpot = 1000
                self.jackpotLabel.text = "Jackpot: \(self.jackpot)"
            }))
            //self.present(alert, animated: true, completion: nil)
        }
    }
    
    // Show Game Over alert and restart the game
    func gameOver(){
        Model.instance.playSound(sound: Constant.smw_game_over)
        let alert = UIAlertController(title: "Game Over", message: "You are out of coins! \nPlay Again?", preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.startSlothMachine()
        }))
        //self.present(alert, animated: true, completion: nil)
        self.resetResultOutcomes()
        self.resetPlayerStats()
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
        jackpotLabel.text = "Jackpot: \(jackpot)"
        winnings = 0
        turn = 0
        winNumber = 0
        lossNumber = 0
        winRatio = 0
        updatePlayerStatus()
    }
}
