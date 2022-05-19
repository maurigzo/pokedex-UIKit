//
//  PokedexController.swift
//  Pokedex
//
//  Created by Mauri on 10/05/2022.
//

import Foundation
import UIKit

protocol PokedexControllerDelegate: AnyObject {
    func gotPokemons(_ pokemons: [PokemonExpanded], artworks: [URL: UIImage])
}

class PokemonFetcher {
    var pokemonsExpanded: [PokemonExpanded] = []
    var pokemonArtworks: [URL : UIImage] = [ : ]
    weak var delegate: PokedexControllerDelegate?

    func getPokemonImages(pokemons: [Pokemon]) {
        let dispatchGroup = DispatchGroup()
        pokemons.forEach({ pokemon in
            dispatchGroup.enter()
            self.loadPokemon(pokemon, onCompletion: {
                dispatchGroup.leave()
            })
        })
        dispatchGroup.notify(queue: .main, execute: {
            guard let delegate = self.delegate else {
                fatalError("Can't continue without delegate")
            }
            self.sortPokemons()
            delegate.gotPokemons(self.pokemonsExpanded, artworks: self.pokemonArtworks)
        })
    }
    
    private func loadPokemon(_ pokemon: Pokemon, onCompletion: @escaping (() -> Void)) {
        let pokemonExpandedRequest = PokemonExpandedRequest(url: pokemon.url)
        
        pokemonExpandedRequest.execute { result in
            switch result {
            case .failure(let error):
                print("Error: \(error)")
            case .success(let pokemonExpanded):
                self.pokemonsExpanded.append(pokemonExpanded)
                let artworkURL = self.getOfficialPokemonArtwork(pokemonExpanded)
                let artworkImage = self.convertURLToUIImage(artwork: artworkURL)
                self.pokemonArtworks[artworkURL] = artworkImage
                onCompletion()
            }
        }
    }
    
    func getOfficialPokemonArtwork(_ pokemonExpanded: PokemonExpanded) -> URL {
        return pokemonExpanded.sprites.otherSprites.officialArtwork.frontArtwork
    }
    
    func convertURLToUIImage(artwork url: URL) -> UIImage? {
        if let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        return nil
    }
    
    private func sortPokemons(){
        pokemonsExpanded.sort {
            $0.number < $1.number
        }
    }
    
}
