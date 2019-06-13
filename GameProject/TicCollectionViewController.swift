//
//  TicCollectionViewController.swift
//  GameProject
//
//  Created by Annicha Hanwilai on 6/12/19.
//  Copyright © 2019 Annicha Hanwilai. All rights reserved.
//

import UIKit

class TicCollectionViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    let collectionData = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
    
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
        cell.positionLabel = collectionData[indexPath.row]
        cell.backgroundColor = .black
        return cell
    }
    
    
}

extension TicCollectionViewController: TickCollectionViewCellDelegate {
    func checkWinner(positionLabel: String?) {
        let checker = ViewController()
        
        if checker.checkHorizontal(position: self.positionLabel) || checker.checkHorizontal(position: self.positionLabel) || checker.checkDiagonal(position: self.positionLabel) {
            updateWinnerText()
        } else {
            updatePlayersTurnText()
        }
    }
    
    func updatePlayersTurnText() {
        <#code#>
    }
    
    func updateWinnerText() {
        <#code#>
    }

}
