//
//  MovieDetailWorker.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieDetailWorkerLogic {

}

class MovieDetailWorker {

    private let service: MovieDetailWorkerLogic

    init(service: MovieDetailWorkerLogic) {
        self.service = service
    }

}
