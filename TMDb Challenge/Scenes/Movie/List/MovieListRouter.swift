//
//  MovieListRouter.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

@objc protocol MovieListRoutingLogic {

}

protocol MovieListDataPassing {
    var dataStore: MovieListDataStore? { get }
}

class MovieListRouter: NSObject, MovieListRoutingLogic, MovieListDataPassing {

    // Var's
    weak var viewController: MovieListViewController?
    var dataStore: MovieListDataStore?

}
