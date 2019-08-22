//
//  EpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Ramón Seoane Martín on 19/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 25
    }
    
}
