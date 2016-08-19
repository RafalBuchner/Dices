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
        var myModValue = Int(myMod.text! as String!)
        
        ///// level
        let appLevel = throwDice.listOfLevels[Int(sliderLevel.value)]
        if myModValue == nil {myModValue = 0}
        
        ///// number of dices for cumulationD10
        let myNumberOfDices = Int(numberOfDices.text! as String!)
        let numOfDicesValue: Int
        if myNumberOfDices != nil {
            numOfDicesValue = myNumberOfDices!
        } else {
            numOfDicesValue = 0
        }
        ///// DiceModel methods and result printer:
        let resultOf: Int!
        
        switch diceIndex {
        case 0:
            resultOf = throwDice.d10(appLevel,customLevel: myModValue!)
            mainResult.text = "Result: \(resultOf), with modificators:  \(appLevel/10) + \(myModValue!)"
        case 1:
            resultOf = throwDice.d100(appLevel,customLevel: myModValue!)
            mainResult.text = "Result: \(resultOf), with modificators:  \(appLevel) + \(myModValue!)"
        case 2:
            resultOf = throwDice.cumulationD10(numOfDicesValue, level: appLevel,customLevel: myModValue!)
            mainResult.text = "Result: \(resultOf), with modificators:  \(appLevel/10) + \(myModValue!)"
        default:
            resultOf = 0000
            mainResult.text = "Result: \(resultOf), with modificators:  \(appLevel) + \(myModValue!)"
        }
        
        
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
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

