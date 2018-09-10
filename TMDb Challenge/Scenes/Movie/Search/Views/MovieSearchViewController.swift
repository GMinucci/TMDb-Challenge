//
//  MovieSearchViewController.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

class MovieSearchViewController: UITableViewController {

    // Var's
    var interactor: MovieSearchBusinessLogic?
    var router: (NSObjectProtocol & MovieSearchRoutingLogic & MovieSearchDataPassing)?

    let searchController = UISearchController(searchResultsController: nil)
    var movieList = [MovieSearch.Search.ViewModel.MovieViewModel]()
    
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
        navigationItem.largeTitleDisplayMode = .never
        setupTableView()
        setupSearchBar()
    }

}
