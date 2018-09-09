//
//  MovieListPresenter.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieListPresentationLogic {
    func dismissLoading(response: MovieList.List.Response.DismissLoading)
    func getUpcomingMoviesSuccess(response: MovieList.List.Response.Success)
    func getUpcomingMoviesFailure(response: MovieList.List.Response.Failure)
}

class MovieListPresenter: MovieListPresentationLogic {

    // Var's
    weak var viewController: MovieListDisplayLogic?

    func getUpcomingMoviesSuccess(response: MovieList.List.Response.Success) {
        let movieList = response.movieList.map({
            MovieList.List.ViewModel.MovieViewModel(
                posterImageURL: URL(string: "https://image.tmdb.org/t/p/original\($0.posterPath ?? "")"),
                title: $0.title,
                description: $0.overview)
        })
        let viewModel = MovieList.List.ViewModel.Success(movieList: movieList)
        viewController?.getUpcomingMoviesSuccess(viewModel: viewModel)
    }
    
    func dismissLoading(response: MovieList.List.Response.DismissLoading) {
        let viewModel = MovieList.List.ViewModel.DismissLoading()
        viewController?.dismissLoading(viewModel: viewModel)
    }
    
    func getUpcomingMoviesFailure(response: MovieList.List.Response.Failure) {
        let viewModel = MovieList.List.ViewModel.Failure(message: response.error.localizedDescription)
        viewController?.getUpcomingMoviesFailure(viewModel: viewModel)
    }
    
}
