//
//  LevelCollectionViewCell.swift
//  HelpChildren
//
//  Created by João Gabriel on 03/12/18.
//  Copyright © 2018 João Gabriel de Britto e Silva. All rights reserved.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var levelImage: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        self.layer.cornerRadius = 10.0
//        self.contentView.layer.cornerRadius = 10.0
//        self.contentView.layer.borderWidth = 1.0
//        self.contentView.layer.borderColor = UIColor.clear.cgColor
//        self.contentView.layer.masksToBounds = true
//
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        self.layer.shadowRadius = 2.0
//        self.layer.shadowOpacity = 0.5
//        self.layer.masksToBounds = false
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    func setup(with menu: Menu) {
        levelImage.image = UIImage(named: menu.image)
        levelLabel.text = menu.levelDescription
    }
}
