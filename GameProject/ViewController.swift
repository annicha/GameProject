//
//  ViewController.swift
//  GameProject
//
//  Created by Annicha Hanwilai on 6/12/19.
//  Copyright © 2019 Annicha Hanwilai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hasWon: Bool = false
    
    let dic = ["a1": "", "a2": "", "a3": "", "b1": "", "b2": "", "b3": "", "c1": "", "c2": "", "c3": ""]
    
    let numArray = ["1", "2", "3"]
    let letterArray = ["a", "b", "c"]
    
    var playerOneTurn = true
    var playerTwoTurn = false
    
    @IBOutlet weak var aOne: UIButton!
    @IBOutlet weak var aTwo: UIButton!
    @IBOutlet weak var aThree: UIButton!
    @IBOutlet weak var bOne: UIButton!
    @IBOutlet weak var bTwo: UIButton!
    @IBOutlet weak var bThree: UIButton!
    @IBOutlet weak var cOne: UIButton!
    @IBOutlet weak var cTwo: UIButton!
    @IBOutlet weak var cThree: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Anne is making change.")
    }
    
    func checkHorizontal(button: UIButton) -> Bool {
        let letter = button.accessibilityIdentifier?.first
        let num = button.accessibilityIdentifier?.last
        var check = ""
        for i in letterArray where i != String(letter!) {
            var stringNum = String(num!)
            stringNum.insert(Character(i), at: stringNum.startIndex)
            if check == "" {
                check = dic[stringNum]!
            } else {
                let result = check == dic[stringNum]! ? true : false
                return result
            }
        }
        return false
    }
    
    func checkVertical(button: UIButton) -> Bool {
        let letter = button.accessibilityIdentifier?.first
        let num = button.accessibilityIdentifier?.last
        var check = ""
        for i in numArray where i != String(num!) {
            var stringLetter = String(letter!)
            stringLetter.insert(Character(i), at: stringLetter.endIndex)
            if check == "" {
                check = dic[stringLetter]!
            } else {
                let result = check == dic[stringLetter]! ? true : false
                return result
            }
        }
        return false
    }
    
    func checkDiagonal(button: UIButton) -> Bool {
        let letter = button.accessibilityIdentifier?.first
        let num = button.accessibilityIdentifier?.last
        var check = ""
        var token = 0
        if button.accessibilityIdentifier == "b2" {
            for i in letterArray where i != String(letter!) {
                token += 1
                for number in numArray where number != String(num!) && number != "2" {
                    var stringNum = String(letter!)
                    stringNum.insert(Character(number), at: stringNum.endIndex)
                    let result = check == dic[stringNum]! ? true : false
                    if token == 2 {
                        return result
                    }
                }
            }
        } else {
            for i in letterArray where i != String(letter!) {
                if i == "b" {
                    check = dic["b2"]!
                } else {
                    for number in numArray where number != String(num!) && number != "2" {
                        var stringNum = String(letter!)
                        stringNum.insert(Character(number), at: stringNum.endIndex)
                        let result = check == dic[stringNum]! ? true : false
                        return result
                    }
                }
            }
        }
        return false
    }
    
//        while hasWon == false {
//        }

}

