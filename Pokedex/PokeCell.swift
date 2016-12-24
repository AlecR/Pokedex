//
//  PokeCell.swift
//  Pokedex
//
//  Created by Alec Rodgers on 12/22/16.
//  Copyright © 2016 Alec Rodgers. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
	
	
	@IBOutlet weak var thumbImg: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	
	var pokemon: Pokemon!
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		layer.cornerRadius = 5.0
	}
	
	func configureCell(_ pokemon: Pokemon) {
		self.pokemon = pokemon
		
		nameLabel.text = self.pokemon.name.capitalized
		thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
	}
    
}
