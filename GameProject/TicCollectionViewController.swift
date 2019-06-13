//
//  TicCollectionViewController.swift
//  GameProject
//
//  Created by Annicha Hanwilai on 6/12/19.
//  Copyright © 2019 Annicha Hanwilai. All rights reserved.
//

import UIKit

class TicCollectionViewController: UIViewController {

    var playerTurnText: String = "x"
    
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    let collectionData = ["a1", "b1", "c1", "a2", "b2", "c2", "a3", "b3", "c3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let width = (backgroundView.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        collectionView.backgroundColor = .red
    }

}

extension TicCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ticCell", for: indexPath) as? TickCollectionViewCell else {return UICollectionViewCell()}
        cell.delegate = self
        cell.positionLabel = collectionData[indexPath.row]
        cell.backgroundColor = .black
        return cell
    }
    
    
}

extension TicCollectionViewController: TickCollectionViewCellDelegate {
    func checkWinner(positionLabel: String?) {
        guard let positionLabel = positionLabel,
            !ViewController.hasWon
            else { print("can't find position label or someone has won"); return }
        
        updatePlayersTurnText()
        
        let checker = ViewController()
        
        print("Horizontal: \(checker.checkHorizontal(position: positionLabel))")
        print("Vertical: \(checker.checkVertical(position: positionLabel))")
        print("Diagnal: \(checker.checkDiagonal(position: positionLabel))")
        print("Statement return: \(checker.checkHorizontal(position: positionLabel) || checker.checkHorizontal(position: positionLabel) || checker.checkDiagonal(position: positionLabel))")

        if checker.checkHorizontal(position: positionLabel) || checker.checkHorizontal(position: positionLabel) || checker.checkDiagonal(position: positionLabel) {
            updateWinnerText()
        } else {
            togglePlayerTurn()
            updatePlayersTurnText()
        }
    }
    
    func updatePlayersTurnText() {
        self.playerTurnText = ViewController.playerOneTurn == true ? "x" : "o"
        print("It's now \(playerTurnText) turn.\n")
    }
    
    func updateWinnerText() {
        let winningPlayer: String = playerTurnText
        print("\(winningPlayer) just won!")
    }
    
    func togglePlayerTurn() {
        ViewController.playerOneTurn = !ViewController.playerOneTurn
        ViewController.playerTwoTurn = !ViewController.playerTwoTurn
    }
    
    func updateDictionary(positionLabel: String){
        ViewController.dic[positionLabel] = playerTurnText
    }

}
