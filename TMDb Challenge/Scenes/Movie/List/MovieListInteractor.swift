//
//  MovieListInteractor.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieListBusinessLogic {

}

protocol MovieListDataStore {

}

class MovieListInteractor: MovieListBusinessLogic, MovieListDataStore {

    // Var's
    var presenter: MovieListPresentationLogic?
    let worker = MovieListWorker()

}
