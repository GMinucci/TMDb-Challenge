//
//  MovieDetailInteractor.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieDetailBusinessLogic {

}

protocol MovieDetailDataStore {
    var movieID: Int? { get set }
}

class MovieDetailInteractor: MovieDetailBusinessLogic, MovieDetailDataStore {

    // Var's
    var presenter: MovieDetailPresentationLogic?
//    let worker = MovieDetailWorker(service: <serviceClass>())
    
    var movieID: Int?

}
