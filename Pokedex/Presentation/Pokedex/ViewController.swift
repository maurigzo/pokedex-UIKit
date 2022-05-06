//
//  ViewController.swift
//  Pokedex
//
//  Created by Mauri on 06/05/2022.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "PokedexTableViewCell", bundle: nil), forCellReuseIdentifier: "i")
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "i") as? PokedexTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
    
    
}
