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
    
    func displayPokemon(_ model: PokedexCellViewModel) {
        nameLabel.text = model.name
        numberLabel.text = model.numberText
        pokemonImageView.image = model.image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView.image = nil
    }
}
