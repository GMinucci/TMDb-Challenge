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

    func searchMovie(request: MovieSearch.Search.Request) {
        // 
    }
    
}
