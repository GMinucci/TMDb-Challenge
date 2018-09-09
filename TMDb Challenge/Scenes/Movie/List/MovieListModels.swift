//
//  MovieListModels.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

enum MovieList {
    enum List {
        struct Request {
            enum Mode {
                case load, next, reload
            }
            
            let mode: Mode
        }
        
        enum Response {
            struct Success {
                let movieList: [MovieListModel]
            }
            
            struct Failure {
                let error: Error
            }
        }
        
        enum ViewModel {
            struct MovieViewModel {
                let backdropImageURL: URL?
                let posterImageURL: URL?
                let title: String?
                let description: String?
            }
            
            struct Success {
                let movieList: [MovieViewModel]
            }
            
            struct Failure {
                let message: String
            }
        }
    }
}
