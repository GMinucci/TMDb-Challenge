//
//  MovieDetailViewController+TableView.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.isScrollEnabled = false
        tableView.register(MovieInfoTableViewCell.self, forCellReuseIdentifier: MovieInfoTableViewCell.reuseIdentifier)
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.reuseIdentifier, for: indexPath) as? MovieInfoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "Titulo"
        cell.descriptionLabel.text = "lorem ipsum dolor sit emet, lorem ipsum dolor sit emet, lorem ipsum dolor sit emet."
        cell.descriptionLabel.sizeToFit()
        
        return cell
    }
    
}
