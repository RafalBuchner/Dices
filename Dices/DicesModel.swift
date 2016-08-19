//
//  DicesModel.swift
//  Dices
//
//  Created by Rafal Buchner on 18.08.2016.
//  Copyright © 2016 Rafal Buchner. All rights reserved.
//

import Foundation

class DiceModel {
    // properties are hard-level

    // 1 – levels stored in buttons
    let vHard   =  30
    let hard    =  20
    let notEasy =  10
    let normal  =  0
    let qEasy   = -10
    let easy    = -20
    let vEasy   = -30
    var customLevel: Int? // it is initialized as optional value, becouse if it weren't user should put write 0 value every time when he/she doesn't want to use  custom modificator to his/hers rsult-dice-value
    
    // customLevels
    init(customLevel: Int?) {
         self.customLevel = customLevel
    }

    func setLevel(level:Int, customLevel:Int) -> Int {
        return level + customLevel
     } 

    func d10(level: Int) -> Int { // rzut kostką dziesięciościenną
        let random = Int(arc4random_uniform(10))
        print(  "random result = \(random)")
        return Int(random) + level
    }
    func d100(level: Int) -> Int { // rzut kostką stuścienną (tzw. procentowy)
        let random = Int(arc4random_uniform(100))
        print("random result = \(random)")
        return Int(random) + level
    }
    func cumulationD10(numberOfDices: Int, level: Int?) -> Int { // suma rzutu wieloma kośćmi d10
        var sum: Int = 0
        // dodawanie modyfikatora
        if level != nil {
            sum += level!
        }
        
        if numberOfDices > 0 {
            for _ in 1...numberOfDices{
                sum += Int(arc4random_uniform(10))
            }
        } else {
            sum = 0
        }
        
        return sum
    }}
