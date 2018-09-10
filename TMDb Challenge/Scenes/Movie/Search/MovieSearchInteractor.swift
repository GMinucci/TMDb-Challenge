//
//  MovieSearchInteractor.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieSearchBusinessLogic {
    func searchMovie(request: MovieSearch.Search.Request)
}

protocol MovieSearchDataStore {
    var movieList: [MovieListModel] { get set }
    var nextPage: Int? { get set }
}

class MovieSearchInteractor: MovieSearchBusinessLogic, MovieSearchDataStore {

    // Var's
    var presenter: MovieSearchPresentationLogic?
    let worker = MovieSearchWorker()
    
    internal(set) var movieList = [MovieListModel]()
    internal var nextPage: Int?
    private var lastQuery = ""

    func searchMovie(request: MovieSearch.Search.Request) {
        if let currentQuery = request.query {
            lastQuery = currentQuery
        }
        
        if request.mode == .next && nextPage == nil {
            // If the load mode is to load next page and there is no next page don't do anything
            let response = MovieSearch.Search.Response.DismissLoading()
            presenter?.dismissLoading(response: response)
            return
        }
        
        let requestedQuery = request.query ?? lastQuery
        let requestedPage = nextPage ?? 1
        worker
            .updateGenreList()
            .then { self.worker.searchMovie(query: requestedQuery, page: requestedPage) }
            .done { (result) in
                if requestedPage + 1 <= result.totalPages {
                    self.nextPage = requestedPage + 1
                }
                else {
                    self.nextPage = nil
                }
                
                if request.mode == .load {
                    self.movieList.removeAll()
                }
                self.movieList.append(contentsOf: result.results)
                let response = MovieSearch.Search.Response.Success(movieList: self.movieList)
                self.presenter?.searchMovieSuccess(response: response)
        }
            .catch { (error) in
                let response = MovieSearch.Search.Response.Failure(error: error)
                self.presenter?.searchMovieFailure(response: response)
        }
    }
    
}
