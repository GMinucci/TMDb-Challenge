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
    func shareMovieSuccess(viewModel: MovieDetail.Share.ViewModel.Success)
    func shareMovieFailure(viewModel: MovieDetail.Share.ViewModel.Failure)
}

extension MovieDetailViewController: MovieDetailDisplayLogic {

    func getMovieDetailsSuccess(viewModel: MovieDetail.Get.ViewModel.Success) {
        // Set heading data
        title = viewModel.title
        moviewOverviewLabel.text = viewModel.overview
        moviePosterHeadingView.movieGenreLabel.text = viewModel.genres
        moviePosterHeadingView.movieTitleLabel.text = viewModel.title
        moviePosterHeadingView.backdropImageView.kf.setImage(with: viewModel.backdropImageURL)
        moviePosterHeadingView.posterImageView.kf.setImage(with: viewModel.posterImageURL)
        
        // Set info table view data
        movieInfo = viewModel.info
        tableView.reloadData()
        view.layoutIfNeeded()
        tableViewHeightConstraint.constant = tableView.contentSize.height
        view.layoutIfNeeded()
        hideLoading()
    }
    
    func getMovieDetailsFailure(viewModel: MovieDetail.Get.ViewModel.Failure) {
        showAlert(message: viewModel.message)
        hideLoading()
    }
    
    func shareMovieSuccess(viewModel: MovieDetail.Share.ViewModel.Success) {
        let shareController = UIActivityViewController(activityItems: [viewModel.message], applicationActivities: nil)
        present(shareController, animated: true, completion: nil)
    }
    
    func shareMovieFailure(viewModel: MovieDetail.Share.ViewModel.Failure) {
        showAlert(message: viewModel.message)
    }
    
}
