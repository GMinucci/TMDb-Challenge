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
    
    internal(set) var movieList = [MovieListModel]()
    internal var nextPage: Int?
    private var isFetching = false
    
    func getUpcomingMovies(request: MovieList.List.Request) {
        guard !isFetching else {
            let response = MovieList.List.Response.DismissLoading()
            presenter?.dismissLoading(response: response)
            return
        }
        
        if request.mode == .load && movieList.count > 0 {
            // If the load mode is to just load content and already have content don't do anything
            let response = MovieList.List.Response.DismissLoading()
            presenter?.dismissLoading(response: response)
            return
        }
        
        if request.mode == .next && nextPage == nil {
            // If the load mode is to load next page and there is no next page don't do anything
            let response = MovieList.List.Response.DismissLoading()
            presenter?.dismissLoading(response: response)
            return
        }
        
        let requestedPage = nextPage ?? 1
        isFetching = true
        worker.getUpcomingMovies(page: requestedPage)
            .done { (result) in
                if requestedPage + 1 <= result.totalPages {
                    self.nextPage = requestedPage + 1
                }
                else {
                    self.nextPage = nil
                }
                    
                self.movieList.append(contentsOf: result.results)
                let response = MovieList.List.Response.Success(movieList: self.movieList)
                self.presenter?.getUpcomingMoviesSuccess(response: response)
                self.isFetching = false
        }
            .catch { (error) in
                let response = MovieList.List.Response.Failure(error: error)
                self.presenter?.getUpcomingMoviesFailure(response: response)
                self.isFetching = false
        }
    }

}
