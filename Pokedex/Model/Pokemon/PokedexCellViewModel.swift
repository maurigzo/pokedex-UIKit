//
//  PokedexCellViewModel.swift
//  Pokedex
//
//  Created by Mauri on 16/05/2022.
//

import Foundation
import UIKit

struct PokedexCellViewModel {
    let name: String
    let number: Int
    let image: UIImage?
    let types: [PokemonType]
}

extension PokedexCellViewModel {
    var numberText: String {
        "#\(number)"
    }
    var capitalizedName: String {
        name.capitalized
    }
    
    var firstType: String {
        types[0].type.name.capitalized
    }
    
    var secondType: String? {
        if types.count < 2 {
            return nil
        }
        return types[1].type.name.capitalized
    }
}
