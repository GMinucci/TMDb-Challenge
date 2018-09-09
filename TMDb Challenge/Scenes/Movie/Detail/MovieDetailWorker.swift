//
//  MovieDetailWorker.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit
import PromiseKit

class MovieDetailWorker {

    func getMovieDetails(id: Int) -> Promise<MovieDetailModel> {
        return MoviesAPIService.getMovieDetail(id: id)
    }

}
