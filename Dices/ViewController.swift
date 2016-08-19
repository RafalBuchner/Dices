//
//  ViewController.swift
//  Dices
//
//  Created by Rafal Buchner on 18.08.2016.
//  Copyright © 2016 Rafal Buchner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var typeOfDice: UISegmentedControl! // typeOfDice.selectedSegmentIndex
    @IBOutlet weak var myMod: UITextField!
    @IBOutlet weak var mainResult: UILabel!
    @IBOutlet weak var numberOfDices: UITextField!
    @IBOutlet weak var sliderLevel: UISlider!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBAction func rollDice(sender: AnyObject) {
        print(Int(sliderLevel.value))
        let diceIndex  = typeOfDice.selectedSegmentIndex
        let myModValue = Int(myMod.text! as String!)
        let appLevel: Int
        let myLevel: Int // in if following statement program calculates its value
        ///// level
        switch Int(sliderLevel.value) {
        case 0:
            appLevel = throwDice.vEasy
        case 1:
            appLevel = throwDice.easy
        case 2:
            appLevel = throwDice.qEasy
        case 3:
            appLevel = throwDice.normal
        case 4:
            appLevel = throwDice.notEasy
        case 5:
            appLevel = throwDice.hard
        case 6:
            appLevel = throwDice.vHard
        default:
            appLevel = throwDice.normal
        }
        if myModValue != nil {
            myLevel = appLevel + myModValue!
        } else {
            myLevel = appLevel
        }
       
        let myNumberOfDices = Int(numberOfDices.text! as String!)
        let numOfDicesValue: Int
        if myNumberOfDices != nil {
            numOfDicesValue = myNumberOfDices!
        } else {
            numOfDicesValue = 0
        }
        ///// DiceModel methods:
        let resultOf: Int!
        
        switch diceIndex {
        case 0:
            resultOf = throwDice.d10(myLevel)
        case 1:
            resultOf = throwDice.d100(myLevel)
        case 2:
            resultOf = throwDice.cumulationD10(numOfDicesValue, level: myLevel)
        default:
            resultOf = 0000
        }
        print("throw dices: \(resultOf)")
        mainResult.text = "Result: \(resultOf), with modificators:  \(myLevel)"
        
    }
    
    
    @IBAction func clearMods(sender: AnyObject) {
        numberOfDices.text = ""
        myMod.text = ""
        sliderLevel.value = 3
        
    }
    //////////////////
    let throwDice = DiceModel(customLevel: 0) // OBJECT!!! IS HERE !!! LOOKOUT !!!
    @IBAction func slider(sender: AnyObject) {
        let numLevel = Int(sliderLevel.value)
        switch numLevel {
        case 0:
            levelLabel.text = "level: very easy"
        case 1:
            levelLabel.text = "level: easy"
        case 2:
            levelLabel.text = "level: quite easy"
        case 3:
            levelLabel.text = "level: normal"
        case 4:
            levelLabel.text = "level: not easy"
        case 5:
            levelLabel.text = "level: hard"
        case 6:
            levelLabel.text = "level: very hard"
        default:
            levelLabel.text = "level"
        }

    }
    /*
    func refresUI() {
        let numLevel = Int(sliderLevel.value)
        switch numLevel {
        case 0:
            levelLabel.text = "level: very easy"
        case 1:
            levelLabel.text = "level: easy"
        case 2:
            levelLabel.text = "level: quite easy"
        case 3:
            levelLabel.text = "level: normal"
        case 4:
            levelLabel.text = "level: not easy"
        case 5:
            levelLabel.text = "level: hard"
        case 6:
            levelLabel.text = "level: very hard"
        default:
            levelLabel.text = "level"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refresUI()
    }
 */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

