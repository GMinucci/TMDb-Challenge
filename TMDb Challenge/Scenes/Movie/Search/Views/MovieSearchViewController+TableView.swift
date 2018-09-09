//
//  MovieSearchViewController+TableView.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

extension MovieSearchViewController {
    
    func setupTableView() {
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: MovieListTableViewCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor.tmdb.secondaryDark
        tableView.backgroundColor = UIColor.tmdb.primaryDark
        tableView.rowHeight = tableView.bounds.size.width/2
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
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movieList.count - 5 {
            let request = MovieSearch.Search.Request(mode: .next, query: nil)
            interactor?.searchMovie(request: request)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MovieDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
