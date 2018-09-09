//
//  MovieListViewController.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

class MovieListViewController: UITableViewController {

    // Var's
    var interactor: MovieListBusinessLogic?
    var router: (NSObjectProtocol & MovieListRoutingLogic & MovieListDataPassing)?
    
    var movieList = [MovieList.List.ViewModel.MovieViewModel]()

    // Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let request = MovieList.List.Request(mode: .load)
        interactor?.getUpcomingMovies(request: request)
    }

}
