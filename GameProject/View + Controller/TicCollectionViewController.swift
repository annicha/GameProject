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
    
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    let collectionData = ["a1", "b1", "c1", "a2", "b2", "c2", "a3", "b3", "c3"]
    var turnCount: Int = GameControler.dic.count
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let width = (backgroundView.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        collectionView.backgroundColor = .red
        updatePlayersTurnText()

    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        resetGame()
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "Congrats!", message: "\(playerTurnText) won the game!", preferredStyle: .alert)
        let playAgain = UIAlertAction(title: "Play Again", style: .default) { (_) in
            self.resetGame()
        }
        
        alert.addAction(playAgain)
        present(alert, animated: true)
    }
    
    func resetGame(){
        
        GameControler.playerOneTurn = true
        GameControler.playerTwoTurn = false
        self.turnCount = GameControler.dic.count
        updatePlayersTurnText()
        
        for (key, _) in GameControler.dic {
            GameControler.dic[key] = ""
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.playerTurnText = "x"
            }
        }
    }

}

extension TicCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ticCell", for: indexPath) as? TicCollectionViewCell else {return UICollectionViewCell()}
        cell.delegate = self
        cell.positionLabel = collectionData[indexPath.row]
        cell.backgroundColor = .black
        cell.ticImageView.image = nil
        cell.ticImageView.anchor(top: cell.topAnchor, bottom: cell.bottomAnchor, leading: cell.leadingAnchor, trailing: cell.trailingAnchor, paddingTop: 14, paddingBottom: -14, paddingLeading: 14, paddingTrailing: -14, width: nil, height: nil)
        
        return cell
    }
    
    
}

extension TicCollectionViewController: TicCollectionViewCellDelegate {
    func checkWinner(positionLabel: String?) {
        guard let positionLabel = positionLabel,
            !GameControler.hasWon
            else { print("can't find position label or someone has won"); return }
        
        let checker = GameControler()
        print("\n\nChecking\nHorizontal: \(checker.checkHorizontal(position: positionLabel))")
        print("Vertical: \(checker.checkVertical(position: positionLabel))")
        print("Diagnal: \(checker.checkDiagonal(position: positionLabel))")
        print("Statement return: \(checker.checkHorizontal(position: positionLabel) || checker.checkHorizontal(position: positionLabel) || checker.checkDiagonal(position: positionLabel))")

        if checker.checkHorizontal(position: positionLabel) || checker.checkVertical(position: positionLabel) || checker.checkDiagonal(position: positionLabel) {
            alertWinner()
        } else {
            togglePlayerTurn()
            updatePlayersTurnText()
        }
    }
    
    func updatePlayersTurnText() {
        print("\nTurn count: \(turnCount)")
        
        if turnCount > 0 {
            self.playerTurnText = GameControler.playerOneTurn == true ? "x" : "o"
            playerTurnLabel.text = "It's now \(playerTurnText.uppercased())'s turn."
            turnCount -= 1
        } else {
            playerTurnLabel.text = "It's a tie!"
            turnCount = GameControler.dic.count
        }
    }
    
    func alertWinner() {
        presentAlert()
    }
    
    func togglePlayerTurn() {
        GameControler.playerOneTurn = !GameControler.playerOneTurn
        GameControler.playerTwoTurn = !GameControler.playerTwoTurn
    }
    
    func updateDictionary(positionLabel: String){
        GameControler.dic[positionLabel] = playerTurnText
    }

}
