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
    
    func drawPokemon(_ pokemon: Pokemon) {
        nameLabel.text = pokemon.name.capitalized
        
        if let pokemonExpanded = loadJson(filename: "BulbasaurResponse"),
           let artworkURL = getOfficialPokemonArtwork(pokemonExpanded),
           let artworkImage = convertURLToUIImage(artwork: artworkURL) {
            pokemonImageView.image = artworkImage
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView.image = nil
    }
}

private extension PokedexTableViewCell {
    func loadJson(filename fileName: String) -> PokemonExpanded? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(PokemonExpanded.self, from: data)
                return jsonData
            } catch {
                print("error: \(error)")
            }
        }
        return nil
    }
    
    func getOfficialPokemonArtwork(_ pokemonExpanded: PokemonExpanded) -> URL? {
        
        return pokemonExpanded.sprites.otherSprites.officialArtwork.frontArtwork
        
    }
    
    func convertURLToUIImage(artwork url: URL) -> UIImage? {
        
        if let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        
        return nil
        
    }
}
