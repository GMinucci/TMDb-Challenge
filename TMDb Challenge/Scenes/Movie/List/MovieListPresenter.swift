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
    private let dateFormatter = DateFormatter()
    
    func getUpcomingMoviesSuccess(response: MovieList.List.Response.Success) {
        
        let movieList = response.movieList.map({
            MovieList.List.ViewModel.MovieViewModel(
                posterImageURL: MoviesAPIService.buildImageURL(path: $0.posterPath),
                title: $0.title,
                description: buildMovieDescription(movie: $0))
        })
        let viewModel = MovieList.List.ViewModel.Success(movieList: movieList)
        viewController?.getUpcomingMoviesSuccess(viewModel: viewModel)
    }
    
    private func buildMovieDescription(movie: MovieListModel) -> String {
        var description = ""
        // Parse genres
        let genres = MoviesAPIService.session.genreList.filter({ movie.genreIds.contains($0.id) }).compactMap({ $0.name })
        description = description + genres.joined(separator: " • ") + "\n"
        
        // Parse release date
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var releaseDate = ""
        if let date = dateFormatter.date(from: movie.releaseDate) {
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            releaseDate = dateFormatter.string(from: date)
            description += releaseDate
        }
        
        return description
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
