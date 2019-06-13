//
//  ViewController.swift
//  GameProject
//
//  Created by Annicha Hanwilai on 6/12/19.
//  Copyright © 2019 Annicha Hanwilai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    static var hasWon: Bool = false
    
    static var dic = ["a1": "", "a2": "", "a3": "", "b1": "", "b2": "", "b3": "", "c1": "", "c2": "", "c3": ""]
    
    let numArray = ["1", "2", "3"]
    let letterArray = ["a", "b", "c"]
    
    static var playerOneTurn = true
    static var playerTwoTurn = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkHorizontal(position: String) -> Bool {
        let letter = position.first
        let num = position.last
        var check = ""
        for i in letterArray where i != String(letter!) {
            var tag = String(num!)
            tag.insert(Character(i), at: tag.startIndex)
            if check == "" {
                check = ViewController.dic[tag]!
            } else {
                let result = check == ViewController.dic[tag]! ? true : false
                if result {
                    return check == ViewController.dic[position] ? true : false
                }
                return result
            }
        }
        return false
    }
    
    func checkVertical(position: String) -> Bool {
        let letter = position.first
        let num = position.last
        var check = ""
        for i in numArray where i != String(num!) {
            var tag = String(letter!)
            tag.insert(Character(i), at: tag.endIndex)
            if check == "" {
                check = ViewController.dic[tag]!
            } else {
                let result = check == ViewController.dic[tag]! ? true : false
                if result {
                    return check == ViewController.dic[position] ? true : false
                }
                return result
            }
        }
        return false
    }
    
    func checkDiagonal(position: String) -> Bool {
        let letter = position.first
        let num = position.last
        let check = ViewController.dic["b2"]
        if position == "b2" {
            if ViewController.dic["a1"] == ViewController.dic["c3"] && ViewController.dic["a1"] == ViewController.dic["b2"] {
                return true
            } else if ViewController.dic["a3"] == ViewController.dic["c1"] && ViewController.dic["a3"] == ViewController.dic["b2"] {
                return true
            }
        } else {
            for i in letterArray where i != String(letter!) {
                if i == "b" {
                    continue
                } else {
                    for number in numArray where number != String(num!) && number != "2" {
                        var tag = String(i)
                        tag.insert(Character(number), at: tag.endIndex)
                        let result = check == ViewController.dic[tag]! ? true : false
                        if result {
                            return check == ViewController.dic[position] ? true : false
                        }
                        return result
                    }
                }
            }
        }
        return false
    }
}

