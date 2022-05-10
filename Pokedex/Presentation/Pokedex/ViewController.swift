//
//  ViewController.swift
//  Pokedex
//
//  Created by Mauri on 06/05/2022.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let pokedexRequest = PokedexRequest()
    
    var pokemons: [Pokemon]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadPokemons()
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "i") as? PokedexTableViewCell {
            if let pokemons = pokemons {
                cell.displayPokemon(pokemons[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

private extension ViewController {
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
                self.pokemons = model.pokemons
                self.tableView.reloadData()
            }
        }
    }
}
