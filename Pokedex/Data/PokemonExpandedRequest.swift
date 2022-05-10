//
//  PokemonExpandedRequest.swift
//  Pokedex
//
//  Created by Mauri on 09/05/2022.
//

import Foundation
import Networking

final class PokemonExpandedRequest: Request<PokemonExpanded> {
    init(url: URL) {
        super.init(requestData: .init(path: url.absoluteString))
    }
}
