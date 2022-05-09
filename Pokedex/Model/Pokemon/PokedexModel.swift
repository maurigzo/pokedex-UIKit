//
//  PokedexModel.swift
//  Pokedex
//
//  Created by Mauri on 09/05/2022.
//

import Foundation

struct PokedexModel: Codable {
    let pokemons: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case pokemons = "results"
    }
}
