//
//  MovieDetailViewController+DisplayLogic.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieDetailDisplayLogic: class {
    func getMovieDetailsSuccess(viewModel: MovieDetail.Get.ViewModel.Success)
    func getMovieDetailsFailure(viewModel: MovieDetail.Get.ViewModel.Failure)
}

extension MovieDetailViewController: MovieDetailDisplayLogic {

    func getMovieDetailsSuccess(viewModel: MovieDetail.Get.ViewModel.Success) {
        title = viewModel.title
        moviewOverviewLabel.text = viewModel.overview
        moviePosterHeadingView.movieGenreLabel.text = viewModel.genres
        moviePosterHeadingView.movieTitleLabel.text = viewModel.title
        moviePosterHeadingView.backdropImageView.kf.setImage(with: viewModel.backdropImageURL)
        moviePosterHeadingView.posterImageView.kf.setImage(with: viewModel.posterImageURL)
        movieInfo = viewModel.info
        tableView.reloadData()
        tableViewHeightConstraint.constant = tableView.contentSize.height
        view.layoutIfNeeded()
        hideLoading()
    }
    
    func getMovieDetailsFailure(viewModel: MovieDetail.Get.ViewModel.Failure) {
        let alert = UIAlertController(title: "Error", message: viewModel.message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        hideLoading()
    }
    
}
