//
//  MovieDetailPresenter.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieDetailPresentationLogic {
    func getMovieDetailsSuccess(response: MovieDetail.Get.Response.Success)
    func getMovieDetailsFailure(response: MovieDetail.Get.Response.Failure)
}

class MovieDetailPresenter: MovieDetailPresentationLogic {

    // Var's
    weak var viewController: MovieDetailDisplayLogic?

    func getMovieDetailsSuccess(response: MovieDetail.Get.Response.Success) {
        let viewModel = MovieDetail.Get.ViewModel.Success(title: response.movie.title)
        viewController?.getMovieDetailsSuccess(viewModel: viewModel)
    }
    
    func getMovieDetailsFailure(response: MovieDetail.Get.Response.Failure) {
        let viewModel = MovieDetail.Get.ViewModel.Failure(message: response.error.localizedDescription)
        viewController?.getMovieDetailsFailure(viewModel: viewModel)
    }
    
}
