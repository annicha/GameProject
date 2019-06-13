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
    
    func updateWinnerText()
}


class TickCollectionViewCell: UICollectionViewCell {
    
    var positionLabel: String?
    var isClaimed: Bool = false
    
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
        guard let positionLabel = positionLabel,
            isClaimed == false else { return }
        
        print("Tic button at \(positionLabel) tapped")
        
        isClaimed = true
        
    }
    
}
