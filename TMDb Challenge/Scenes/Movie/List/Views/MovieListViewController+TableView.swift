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
        tableView.separatorColor = UIColor.tmdb.secondaryDark
        tableView.backgroundColor = UIColor.tmdb.primaryDark
        tableView.rowHeight = tableView.bounds.size.width/2
        tableView.tableFooterView = UIView()
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
        
        cell.movieDataView.movieTitleLabel.text = movie.title
        cell.movieDataView.movieDescriptionLabel.text = movie.description
        cell.movieDataView.posterImageView.kf.setImage(with: movie.posterImageURL)
        cell.starredImageView.isHidden = !movie.starred
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movieList.count - 5 {
            let request = MovieList.List.Request(mode: .next)
            interactor?.getUpcomingMovies(request: request)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MovieDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
