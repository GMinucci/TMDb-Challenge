//
//  MovieDetailInteractor.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieDetailBusinessLogic {
    func getMovieDetails(request: MovieDetail.Get.Request)
}

protocol MovieDetailDataStore {
    var movieID: Int? { get set }
    var movieDetails: MovieDetailModel? { get set }
}

class MovieDetailInteractor: MovieDetailBusinessLogic, MovieDetailDataStore {

    // Var's
    var presenter: MovieDetailPresentationLogic?
    let worker = MovieDetailWorker()
    
    var movieID: Int?
    internal(set) var movieDetails: MovieDetailModel?
    
    func getMovieDetails(request: MovieDetail.Get.Request) {
        guard let safeID = movieID else {
            let error = NSError(domain: "MovieDetail", code: 1, userInfo: [NSLocalizedDescriptionKey: "Couldn't get any valid movie ID"])
            let response = MovieDetail.Get.Response.Failure(error: error)
            presenter?.getMovieDetailsFailure(response: response)
            return
        }
        
        worker.getMovieDetails(id: safeID)
            .done { (result) in
                self.movieDetails = result
                let response = MovieDetail.Get.Response.Success(movie: result)
                self.presenter?.getMovieDetailsSuccess(response: response)
        }
            .catch { (error) in
                let response = MovieDetail.Get.Response.Failure(error: error)
                self.presenter?.getMovieDetailsFailure(response: response)
        }
    }

}
