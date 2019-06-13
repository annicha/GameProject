//
//  TicCollectionViewCell.swift
//  GameProject
//
//  Created by Annicha Hanwilai on 6/13/19.
//  Copyright © 2019 Annicha Hanwilai. All rights reserved.
//

import UIKit

protocol TicCollectionViewCellDelegate {
    
    func checkWinner(positionLabel: String?)
    
    func updatePlayersTurnText()
    
    func togglePlayerTurn()
    
    func alertWinner()
    
    func updateDictionary(positionLabel: String)
}


class TicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ticImageView: UIImageView!
    
    var positionLabel: String?
    var delegate: TicCollectionViewCellDelegate?
    
    lazy var ticButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(ticButton)
        
        ticButton.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0)
        ticButton.addTarget(self, action: #selector(tickButtonTapped), for: .touchUpInside)
    }
    
    @objc func tickButtonTapped(){
        
        guard let positionLabel = self.positionLabel,
            GameControler.dic[positionLabel] == "" else { return }
        
        delegate?.updateDictionary(positionLabel: positionLabel)
        delegate?.checkWinner(positionLabel: positionLabel)
        
        updateView()
    }
    
    func updateView(){

        guard let positionLabel = positionLabel else { return }
        
        let dicValue = GameControler.dic[positionLabel]
        
        switch dicValue {
        case "x": ticImageView.image = UIImage(named: "cross")
        case "o": ticImageView.image = UIImage(named: "circle-outline")
        default: ticImageView.image = nil
        }
    }
}
