//
//  MovieSearchPresenter.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieSearchPresentationLogic {
    func dismissLoading(response: MovieSearch.Search.Response.DismissLoading)
    func searchMovieSuccess(response: MovieSearch.Search.Response.Success)
    func searchMovieFailure(response: MovieSearch.Search.Response.Failure)
}

class MovieSearchPresenter: MovieSearchPresentationLogic {

    // Var's
    weak var viewController: MovieSearchDisplayLogic?

    func searchMovieSuccess(response: MovieSearch.Search.Response.Success) {
        let movieList = response.movieList.map({
            MovieSearch.Search.ViewModel.MovieViewModel(
                posterImageURL: URL(string: "https://image.tmdb.org/t/p/original\($0.posterPath ?? "")"),
                title: $0.title,
                description: $0.overview)
        })
        let viewModel = MovieSearch.Search.ViewModel.Success(movieList: movieList)
        viewController?.searchMovieSuccess(viewModel: viewModel)
    }
    
    func dismissLoading(response: MovieSearch.Search.Response.DismissLoading) {
        let viewModel = MovieSearch.Search.ViewModel.DismissLoading()
        viewController?.dismissLoading(viewModel: viewModel)
    }
    
    func searchMovieFailure(response: MovieSearch.Search.Response.Failure) {
        let viewModel = MovieSearch.Search.ViewModel.Failure(message: response.error.localizedDescription)
        viewController?.searchMovieFailure(viewModel: viewModel)
    }
    
}
