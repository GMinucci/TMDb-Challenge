//
//  MovieListRouter.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

@objc protocol MovieListRoutingLogic {
    func routeToMovieDetail(segue: UIStoryboardSegue?)
}

protocol MovieListDataPassing {
    var dataStore: MovieListDataStore? { get }
}

class MovieListRouter: NSObject, MovieListRoutingLogic, MovieListDataPassing {

    // Var's
    weak var viewController: MovieListViewController?
    var dataStore: MovieListDataStore?
    
    func routeToMovieDetail(segue: UIStoryboardSegue?) {
        if var destinationDS = (segue?.destination as? MovieDetailViewController)?.router?.dataStore {
            passDataToMovieDetail(source: dataStore, destination: &destinationDS)
        }
    }
    
    // MARK: Pass data
    func passDataToMovieDetail(source: MovieListDataStore?, destination: inout MovieDetailDataStore) {
        guard let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row else { return }
        guard source?.movieList.count ?? 0 > selectedRow else { return }
        let selectedMovie = source?.movieList[selectedRow]
        destination.movieID = selectedMovie?.id
    }

}
