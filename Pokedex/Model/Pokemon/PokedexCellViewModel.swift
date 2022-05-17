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
}

extension PokedexCellViewModel {
    var numberText: String {
        "#\(number)"
    }
}
