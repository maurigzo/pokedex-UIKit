//
//  PokemonExpanded.swift
//  Pokedex
//
//  Created by Mauri on 09/05/2022.
//

import Foundation

struct PokemonExpanded: Codable {
    let sprites: PokemonSprite
    let name: String
    let number: Int
    let types: [PokemonType]
    
    enum CodingKeys: String, CodingKey {
        case sprites, name, types
        case number = "id"
    }
}

struct PokemonSprite: Codable {
    let otherSprites: OtherPokemonSprites
    
    enum CodingKeys: String, CodingKey {
        case otherSprites = "other"
    }
}

struct PokemonType: Codable {
    let type: PokemonTypeName
}

struct PokemonTypeName: Codable {
    let name: String
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
