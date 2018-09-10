//
//  MovieListWorker.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit
import PromiseKit

class MovieListWorker {

    func updateGenreList() -> Promise<Void> {
        return MoviesAPIService.getGenreList()
    }
    
    func getUpcomingMovies(page: Int) -> Promise<MovieListResultsPageModel> {
        return MoviesAPIService.getUpcomingMovies(page: page)
    }
    
}
