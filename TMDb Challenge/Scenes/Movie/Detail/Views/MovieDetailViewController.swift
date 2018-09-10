//
//  MovieDetailViewController.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var moviePosterHeadingView: MoviePosterHeadingView!
    @IBOutlet weak var moviewOverviewLabel: UILabel!
    
    @IBAction func shareButtonAction(_ sender: Any) {
        let request = MovieDetail.Share.Request()
        interactor?.shareMovie(request: request)
    }
    
    // Var's
    var interactor: MovieDetailBusinessLogic?
    var router: (NSObjectProtocol & MovieDetailRoutingLogic & MovieDetailDataPassing)?
    
    var movieInfo = [(String, [MovieDetail.Get.ViewModel.Info])]()

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
        setupUIElements()
        setupTableView()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = UIColor.tmdb.primaryDark
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoading(delayed: 0.1)
        let request = MovieDetail.Get.Request()
        interactor?.getMovieDetails(request: request)
    }
    
    private func setupUIElements() {
        moviewOverviewLabel.numberOfLines = 0
        moviewOverviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        moviewOverviewLabel.textColor = UIColor.tmdb.secondaryTextColor
    }
    
}
