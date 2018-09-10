//
//  MovieDetailRouter.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

@objc protocol MovieDetailRoutingLogic {

}

protocol MovieDetailDataPassing {
    var dataStore: MovieDetailDataStore? { get }
}

class MovieDetailRouter: NSObject, MovieDetailRoutingLogic, MovieDetailDataPassing {

    // Var's
    weak var viewController: MovieDetailViewController?
    var dataStore: MovieDetailDataStore?

}
