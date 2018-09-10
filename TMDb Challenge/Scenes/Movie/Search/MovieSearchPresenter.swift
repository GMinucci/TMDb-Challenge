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
    private let dateFormatter = DateFormatter()

    func searchMovieSuccess(response: MovieSearch.Search.Response.Success) {
        let movieList = response.movieList.map({
            MovieSearch.Search.ViewModel.MovieViewModel(
                posterImageURL: MoviesAPIService.buildImageURL(path: $0.posterPath),
                title: $0.title,
                description: buildMovieDescription(movie: $0),
                starred: $0.voteAverage >= 7)
        })
        let viewModel = MovieSearch.Search.ViewModel.Success(movieList: movieList)
        viewController?.searchMovieSuccess(viewModel: viewModel)
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
    
    func dismissLoading(response: MovieSearch.Search.Response.DismissLoading) {
        let viewModel = MovieSearch.Search.ViewModel.DismissLoading()
        viewController?.dismissLoading(viewModel: viewModel)
    }
    
    func searchMovieFailure(response: MovieSearch.Search.Response.Failure) {
        let viewModel = MovieSearch.Search.ViewModel.Failure(message: response.error.localizedDescription)
        viewController?.searchMovieFailure(viewModel: viewModel)
    }
    
}
