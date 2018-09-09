//
//  MovieSearchRouter.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

@objc protocol MovieSearchRoutingLogic {

}

protocol MovieSearchDataPassing {
    var dataStore: MovieSearchDataStore? { get }
}

class MovieSearchRouter: NSObject, MovieSearchRoutingLogic, MovieSearchDataPassing {

    // Var's
    weak var viewController: MovieSearchViewController?
    var dataStore: MovieSearchDataStore?

}
