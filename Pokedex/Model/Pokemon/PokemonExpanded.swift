//
//  PokemonExpanded.swift
//  Pokedex
//
//  Created by Mauri on 09/05/2022.
//

import Foundation

struct PokemonExpanded: Codable {
    
    let sprites: PokemonSprite
    
}

struct PokemonSprite: Codable {
    
    let otherSprites: OtherPokemonSprites
    
    enum CodingKeys: String, CodingKey {
        case otherSprites = "other"
    }
}

struct OtherPokemonSprites: Codable {
    
    let officialArtwork: OfficialPokemonArtwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialPokemonArtwork: Codable {
    
    let frontArtwork: URL

    enum CodingKeys: String, CodingKey {
        case frontArtwork = "front_default"
    }
    
}
