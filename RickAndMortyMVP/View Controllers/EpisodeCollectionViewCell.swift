//
//  EpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Ramón Seoane Martín on 19/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 25
    }
    
}
