//
//  MovieDetailPresenter.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieDetailPresentationLogic {
    func getMovieDetailsSuccess(response: MovieDetail.Get.Response.Success)
    func getMovieDetailsFailure(response: MovieDetail.Get.Response.Failure)
}

class MovieDetailPresenter: MovieDetailPresentationLogic {

    // Var's
    weak var viewController: MovieDetailDisplayLogic?

    func getMovieDetailsSuccess(response: MovieDetail.Get.Response.Success) {
        // Parse movie release date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var releaseDate = ""
        if let date = dateFormatter.date(from: response.movie.releaseDate) {
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            releaseDate = dateFormatter.string(from: date)
        }
        
        // Create movie info table data
        var movieInfo = [(String, [MovieDetail.Get.ViewModel.Info])]()
        var info = [
            MovieDetail.Get.ViewModel.Info(title: "Tagline", description: response.movie.tagline, urlAction: nil),
            MovieDetail.Get.ViewModel.Info(title: "Release date", description: releaseDate, urlAction: nil),
            MovieDetail.Get.ViewModel.Info(title: "Runtime", description: "\(response.movie.runtime ?? 0) min.", urlAction: nil),
            MovieDetail.Get.ViewModel.Info(title: "Original title", description: response.movie.originalTitle, urlAction: nil),
            MovieDetail.Get.ViewModel.Info(title: "Original language", description: response.movie.originalLanguage, urlAction: nil)
        ]
        if let homepage = response.movie.homepage {
            info.append(MovieDetail.Get.ViewModel.Info(title: "Homepage", description: nil, urlAction: URL(string: homepage)))
        }
        movieInfo.append(("Info", info))
        
        let statistics = [
            MovieDetail.Get.ViewModel.Info(title: "Popularity", description: "\(response.movie.popularity)", urlAction: nil),
            MovieDetail.Get.ViewModel.Info(title: "Revenue", description: "\(response.movie.revenue)", urlAction: nil),
            MovieDetail.Get.ViewModel.Info(title: "Vote average", description: "\(response.movie.voteAverage)", urlAction: nil),
            MovieDetail.Get.ViewModel.Info(title: "Vote count", description: "\(response.movie.voteCount)", urlAction: nil)
        ]
        movieInfo.append(("Statistics", statistics))
        
        let viewModel = MovieDetail.Get.ViewModel.Success(
            title: response.movie.title,
            overview: response.movie.overview ?? "-",
            genres: response.movie.genres.compactMap({ $0.name }).joined(separator: " • "),
            backdropImageURL: URL(string: "https://image.tmdb.org/t/p/original\(response.movie.backdropPath ?? "")"),
            posterImageURL: URL(string: "https://image.tmdb.org/t/p/original\(response.movie.posterPath ?? "")"),
            info: movieInfo)
        viewController?.getMovieDetailsSuccess(viewModel: viewModel)
    }
    
    func getMovieDetailsFailure(response: MovieDetail.Get.Response.Failure) {
        let viewModel = MovieDetail.Get.ViewModel.Failure(message: response.error.localizedDescription)
        viewController?.getMovieDetailsFailure(viewModel: viewModel)
    }
    
}
