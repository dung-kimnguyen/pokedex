//
//  CollectionViewCell.swift
//  pokedex
//
//  Created by Dung Kim Nguyen on 08/10/21.
//  Copyright © 2021 Dung Kim Nguyen. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {

    @IBOutlet weak var thumbImage : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!

    var pokemon : Pokemon!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        layer.cornerRadius = 7.0
    }

    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon

        nameLabel.text = self.pokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }

}
