//
//  PokedexRequest.swift
//  Pokedex
//
//  Created by Mauri on 09/05/2022.
//

import Foundation
import Networking

final class PokedexRequest: Request<PokedexModel> {
    init() {
        super.init(requestData: .init(path: "https://pokeapi.co/api/v2/pokemon"))
    }
}
