//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Alec Rodgers on 12/23/16.
//  Copyright © 2016 Alec Rodgers. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
	
	var pokemon: Pokemon!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var mainImage: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var typeLabel: UILabel!
	@IBOutlet weak var defenseLabel: UILabel!
	@IBOutlet weak var heightLabel: UILabel!
	@IBOutlet weak var pokedexLabel: UILabel!
	@IBOutlet weak var weightLabel: UILabel!
	@IBOutlet weak var attackLabel: UILabel!
	@IBOutlet weak var evolutionLabel: UILabel!
	@IBOutlet weak var currentEvolutionImage: UIImageView!
	@IBOutlet weak var nextEvolutionImage: UIImageView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalized
		let image = UIImage(named: "\(pokemon.pokedexId)")
		mainImage.image = image
		currentEvolutionImage.image = image
		pokedexLabel.text = "\(pokemon.pokedexId)"
		
		pokemon.downloadPokemonDetails() {
			self.updateUI()
		}
    }
	
	func updateUI() {
		attackLabel.text = pokemon.attack
		defenseLabel.text = pokemon.defense
		heightLabel.text = pokemon.height
		weightLabel.text = pokemon.weight
		typeLabel.text = pokemon.type
		descriptionLabel.text = pokemon.description
		
		if pokemon.nextEvolutionId == "" {
			evolutionLabel.text = "No Evolutions"
			nextEvolutionImage.isHidden = true
		} else {
			nextEvolutionImage.isHidden = false
			nextEvolutionImage.image = UIImage(named: pokemon.nextEvolutionId)
			let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
			evolutionLabel.text = str
			
		}
		
	}

	@IBAction func backButtonPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	

}
