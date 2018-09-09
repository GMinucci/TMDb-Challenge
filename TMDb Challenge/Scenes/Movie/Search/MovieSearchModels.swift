//
//  MovieSearchModels.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

enum MovieSearch {
    enum Search {
        struct Request {
            enum Mode {
                case load, next
            }
            let mode: Mode
            let query: String?
        }
        
        enum Response {
            struct Success {
                let movieList: [MovieListModel]
            }
            struct DismissLoading {
            }
            struct Failure {
                let error: Error
            }
        }
        
        enum ViewModel {
            struct MovieViewModel {
                let posterImageURL: URL?
                let title: String?
                let description: String?
            }
            struct Success {
                let movieList: [MovieViewModel]
            }
            struct DismissLoading {
            }
            struct Failure {
                let message: String
            }
        }
    }
}
