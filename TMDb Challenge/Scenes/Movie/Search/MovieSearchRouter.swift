//
//  MovieSearchRouter.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

@objc protocol MovieSearchRoutingLogic {
    func routeToMovieDetail(segue: UIStoryboardSegue?)
}

protocol MovieSearchDataPassing {
    var dataStore: MovieSearchDataStore? { get }
}

class MovieSearchRouter: NSObject, MovieSearchRoutingLogic, MovieSearchDataPassing {

    // Var's
    weak var viewController: MovieSearchViewController?
    var dataStore: MovieSearchDataStore?
    
    func routeToMovieDetail(segue: UIStoryboardSegue?) {
        if var destinationDS = (segue?.destination as? MovieDetailViewController)?.router?.dataStore {
            passDataToMovieDetail(source: dataStore, destination: &destinationDS)
        }
    }
    
    // MARK: Pass data
    func passDataToMovieDetail(source: MovieSearchDataStore?, destination: inout MovieDetailDataStore) {
        guard let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row else { return }
        guard source?.movieList.count ?? 0 > selectedRow else { return }
        let selectedMovie = source?.movieList[selectedRow]
        destination.movieID = selectedMovie?.id
    }

}
