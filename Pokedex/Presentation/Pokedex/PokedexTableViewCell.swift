//
//  PokedexTableViewCell.swift
//  Pokedex
//
//  Created by Mauri on 06/05/2022.
//

import UIKit

final class PokedexTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var pokemonImageView: UIImageView!
    
    private var pokemonExpandedRequest: PokemonExpandedRequest?
    private var pokemonExpanded: PokemonExpanded?
    
    func displayPokemon(name: String, number: Int, image: UIImage?) {
        nameLabel.text = name.capitalized
        numberLabel.text = "#\(number)"
        pokemonImageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView.image = nil
    }
}
