//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import UIKit
import Kingfisher


class CharacterTableViewCell: UITableViewCell, IdentifiableCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var viewExterior: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewExterior.layer.cornerRadius = 25
        viewExterior.backgroundColor = #colorLiteral(red: 1, green: 0.6645951271, blue: 0.2553175688, alpha: 1)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(for character: Character) {
        
        self.photo.kf.setImage(with: URL(string: character.photo!))
        self.name.text = character.name
        self.species.text = character.species
        self.gender.text = character.gender
        self.status.text = character.status?.rawValue
    
    }//end configure()
    
}
