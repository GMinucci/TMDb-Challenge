//
//  MovieListWorker.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

protocol MovieListWorkerLogic {

}

class MovieListWorker {

    private let service: MovieListWorkerLogic

    init(service: MovieListWorkerLogic) {
        self.service = service
    }

}
