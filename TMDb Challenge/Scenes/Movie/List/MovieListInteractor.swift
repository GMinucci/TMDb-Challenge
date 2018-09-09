//
//  MovieListInteractor.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieListBusinessLogic {
    func getUpcomingMovies(request: MovieList.List.Request)
}

protocol MovieListDataStore {
    var movieList: [MovieListModel] { get set }
    var nextPage: Int? { get set }
}

class MovieListInteractor: MovieListBusinessLogic, MovieListDataStore {

    // Var's
    var presenter: MovieListPresentationLogic?
    let worker = MovieListWorker()
    
    var movieList = [MovieListModel]()
    var nextPage: Int?
    
    func getUpcomingMovies(request: MovieList.List.Request) {
        if request.mode == .load && movieList.count > 0 {
            // If the load mode is to just load content and already have content don't
            // do anything
            let response = MovieList.List.Response.Success(movieList: movieList)
            presenter?.getUpcomingMoviesSuccess(response: response)
        }
        
        worker.getUpcomingMovies(page: nextPage)
            .done { results in
                self.movieList.append(contentsOf: results)
                let response = MovieList.List.Response.Success(movieList: self.movieList)
                self.presenter?.getUpcomingMoviesSuccess(response: response)
        }
            .catch { error in
                let response = MovieList.List.Response.Failure(error: error)
                self.presenter?.getUpcomingMoviesFailure(response: response)
        }
    }

}
