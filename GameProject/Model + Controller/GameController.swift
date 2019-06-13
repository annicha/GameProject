//
//  GameController.swift
//  GameProject
//
//  Created by Annicha Hanwilai on 6/12/19.
//  Copyright © 2019 Annicha Hanwilai. All rights reserved.
//

import UIKit

class GameControler: UIViewController {
        
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
                check = GameControler.dic[tag]!
            } else {
                let result = check == GameControler.dic[tag]! ? true : false
                if result {
                    return check == GameControler.dic[position] ? true : false
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
                check = GameControler.dic[tag]!
            } else {
                let result = check == GameControler.dic[tag]! ? true : false
                if result {
                    return check == GameControler.dic[position] ? true : false
                }
                return result
            }
        }
        return false
    }
    
    func checkDiagonal(position: String) -> Bool {
        let letter = position.first
        let num = position.last
        let check = GameControler.dic["b2"]
        if position == "b2" {
            if GameControler.dic["a1"] == GameControler.dic["c3"] && GameControler.dic["a1"] == GameControler.dic["b2"] {
                return true
            } else if GameControler.dic["a3"] == GameControler.dic["c1"] && GameControler.dic["a3"] == GameControler.dic["b2"] {
                return true
            }
        } else {
            if position == "b1" || position == "b3" || position == "a2" || position == "c2" {
                return false
            }
            for i in letterArray where i != String(letter!) {
                if i == "b" {
                    continue
                } else {
                    for number in numArray where number != String(num!) && number != "2" {
                        var tag = String(i)
                        tag.insert(Character(number), at: tag.endIndex)
                        let result = check == GameControler.dic[tag]! ? true : false
                        if result {
                            return check == GameControler.dic[position] ? true : false
                        }
                        return result
                    }
                }
            }
        }
        return false
    }
}

