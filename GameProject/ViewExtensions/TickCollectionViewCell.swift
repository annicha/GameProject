//
//  TickCollectionViewCell.swift
//  GameProject
//
//  Created by Annicha Hanwilai on 6/13/19.
//  Copyright © 2019 Annicha Hanwilai. All rights reserved.
//

import UIKit

protocol TickCollectionViewCellDelegate {
    
    func checkWinner(positionLabel: String?)
    
    func updatePlayersTurnText()
    
    func togglePlayerTurn()
    
    func updateWinnerText()
    
    func updateDictionary(positionLabel: String)
}


class TickCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ticImageView: UIImageView!
    
    var positionLabel: String?
    var isClaimed: Bool = false
    var delegate: TickCollectionViewCellDelegate?
    
    lazy var tickButton: TickButton = {
        let button = TickButton()
        return button
    }()
    
    
    override func layoutSubviews() {
        addSubview(tickButton)
        
        tickButton.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0)
        tickButton.addTarget(self, action: #selector(tickButtonTapped), for: .touchUpInside)
    }
    
    @objc func tickButtonTapped(){
        guard let positionLabel = self.positionLabel,
            isClaimed == false else { return }
        isClaimed = true
        
        delegate?.updateDictionary(positionLabel: positionLabel)
        delegate?.checkWinner(positionLabel: positionLabel)
        
        updateView()
    }
    
    func updateView(){
        // check dictionary for that position whether it's nil
        guard let positionLabel = positionLabel else { return }
        
        let dicValue = ViewController.dic[positionLabel]
        
        if dicValue == "" {
            ticImageView.image = nil
        } else if dicValue == "x" {
            ticImageView.image = UIImage(named: "cross")
        } else if dicValue == "o" {
            ticImageView.image = UIImage(named: "circle-outline")
        }
    }
    
}
