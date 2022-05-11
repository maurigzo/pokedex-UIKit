//
//  PokedexViewController.swift
//  Pokedex
//
//  Created by Mauri on 06/05/2022.
//

import UIKit

final class PokedexViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var loadingImage: UIImageView!
    private let pokedexRequest = PokedexRequest()
    private let pokedexController = PokedexController()
    
    var pokemonsExpanded: [PokemonExpanded] = []
    var pokemonArtworks: [URL: UIImage] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokedexController.delegate = self
        setupTableView()
        loadPokemons()
    }
}

extension PokedexViewController: UITableViewDelegate {}

extension PokedexViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonsExpanded.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "i") as? PokedexTableViewCell {
            let pokemon = pokemonsExpanded[indexPath.row]
            let imageURL = pokemon.sprites.otherSprites.officialArtwork.frontArtwork
            cell.displayPokemon(name: pokemon.name, image: pokemonArtworks[imageURL])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

private extension PokedexViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PokedexTableViewCell", bundle: nil), forCellReuseIdentifier: "i")
        tableView.estimatedRowHeight = 2.0
    }

    func loadPokemons() {
        pokedexRequest.execute { result in
            switch result {
            case .failure(let error):
                print("Error: \(error)")
            case .success(let model):
                self.pokedexController.getPokemonImages(pokemons: model.pokemons)
            }
        }
    }
}

extension PokedexViewController: PokedexControllerDelegate {
    func gotPokemons(_ pokemons: [PokemonExpanded], artworks: [URL: UIImage]) {
        pokemonsExpanded = pokemons
        pokemonArtworks = artworks
        tableView.reloadData()
        loadingView.isHidden = true
    }
}
