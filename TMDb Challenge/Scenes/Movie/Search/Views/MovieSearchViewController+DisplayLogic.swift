//
//  MovieSearchViewController+DisplayLogic.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieSearchDisplayLogic: class {
    func dismissLoading(viewModel: MovieSearch.Search.ViewModel.DismissLoading)
    func searchMovieSuccess(viewModel: MovieSearch.Search.ViewModel.Success)
    func searchMovieFailure(viewModel: MovieSearch.Search.ViewModel.Failure)
}

extension MovieSearchViewController: MovieSearchDisplayLogic {

    func searchMovieSuccess(viewModel: MovieSearch.Search.ViewModel.Success) {
        self.movieList = viewModel.movieList
        tableView.reloadData()
        hideLoading()
    }
    
    func dismissLoading(viewModel: MovieSearch.Search.ViewModel.DismissLoading) {
        hideLoading()
    }
    
    func searchMovieFailure(viewModel: MovieSearch.Search.ViewModel.Failure) {
        showAlert(message: viewModel.message)
        hideLoading()
    }
    
}
