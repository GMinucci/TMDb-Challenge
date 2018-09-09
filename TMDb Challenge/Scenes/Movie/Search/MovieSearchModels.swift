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
            let entry: String
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
