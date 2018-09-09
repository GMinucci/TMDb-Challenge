//
//  MovieSearchViewController+DisplayLogic.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieSearchDisplayLogic: class {
    func searchMovieSuccess(viewModel: MovieSearch.Search.ViewModel.Success)
    func searchMovieFailure(viewModel: MovieSearch.Search.ViewModel.Failure)
}

extension MovieSearchViewController: MovieSearchDisplayLogic {

    func searchMovieSuccess(viewModel: MovieSearch.Search.ViewModel.Success) {
        self.movieList = viewModel.movieList
        tableView.reloadData()
    }
    
    func searchMovieFailure(viewModel: MovieSearch.Search.ViewModel.Failure) {
        let alert = UIAlertController(title: "Error", message: viewModel.message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
