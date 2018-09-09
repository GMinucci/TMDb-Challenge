//
//  MovieListViewController+TableView.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit
import Kingfisher

extension MovieListViewController {
    
    func setupTableView() {
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: MovieListTableViewCell.reuseIdentifier)
        tableView.separatorColor = .clear
        tableView.backgroundColor = UIColor(red: 223/255, green: 223/255, blue: 223/255, alpha: 1.0)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.reuseIdentifier, for: indexPath) as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        guard movieList.count > indexPath.row else {
            return UITableViewCell()
        }
        let movie = movieList[indexPath.row]
        
        cell.backdropImageView.kf.setImage(with: movie.backdropImageURL)
        cell.movieDataView.movieTitleLabel.text = movie.title
        cell.movieDataView.movieDescriptionLabel.text = movie.description
        cell.movieDataView.posterImageView.kf.setImage(with: movie.posterImageURL)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1.2 * tableView.bounds.size.width
    }
    
}
