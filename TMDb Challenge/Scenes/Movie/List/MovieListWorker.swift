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

    func getUpcomingMovies(page: Int?) -> Promise<MovieListResultsPageModel> {
        print("REQUEST PAGE \(page)")
        return MoviesAPIService.getUpcomingMovies(page: page)
    }
    
}
