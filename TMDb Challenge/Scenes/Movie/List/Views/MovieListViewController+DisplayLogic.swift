//
//  MovieListViewController+DisplayLogic.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieListDisplayLogic: class {
    func getUpcomingMoviesSuccess(viewModel: MovieList.List.ViewModel.Success)
    func getUpcomingMoviesFailure(viewModel: MovieList.List.ViewModel.Failure)
}

extension MovieListViewController: MovieListDisplayLogic {
    
    func getUpcomingMoviesSuccess(viewModel: MovieList.List.ViewModel.Success) {
        self.movieList = viewModel.movieList
        tableView.reloadData()
    }
    
    func getUpcomingMoviesFailure(viewModel: MovieList.List.ViewModel.Failure) {
        let alert = UIAlertController(title: "Error", message: viewModel.message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
