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
    
    func displayPokemon(_ pokemon: Pokemon) {
        nameLabel.text = pokemon.name.capitalized
        
        pokemonExpandedRequest = PokemonExpandedRequest(url: pokemon.url)
        loadPokemon()
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
    
    func loadPokemon() {
        if let pokemonExpandedRequest = pokemonExpandedRequest {
            pokemonExpandedRequest.execute { result in
                switch result {
                case .failure(let error):
                    print("Error: \(error)")
                case .success(let model):
                    self.pokemonExpanded = model
                    self.drawPokemonImage()
                }
            }
        }
    }
    
    func drawPokemonImage() {
        if let pokemonExpanded = pokemonExpanded,
           let artworkURL = getOfficialPokemonArtwork(pokemonExpanded),
           let artworkImage = convertURLToUIImage(artwork: artworkURL) {
            pokemonImageView.image = artworkImage
        }
    }
}
