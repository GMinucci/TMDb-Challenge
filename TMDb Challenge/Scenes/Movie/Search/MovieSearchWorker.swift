//
//  MovieSearchWorker.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit
import PromiseKit

class MovieSearchWorker {

    func searchMovie(query: String, page: Int) -> Promise<MovieListResultsPageModel> {
        return MoviesAPIService.searchMovie(query: query, page: page)
    }
    
}
