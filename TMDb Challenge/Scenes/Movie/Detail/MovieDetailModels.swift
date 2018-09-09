//
//  MovieDetailModels.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit

enum MovieDetail {
    enum Get {
        
        struct Request {
        }
        
        enum Response {
            struct Success {
                let movie: MovieDetailModel
            }
            struct Failure {
                let error: Error
            }
        }
        
        enum ViewModel {
            struct Info {
                let title: String
                let description: String?
                let urlAction: URL?
            }
            
            struct Success {
                let title: String
                let overview: String
                let genres: String
                let backdropImageURL: URL?
                let posterImageURL: URL?
                let info: [(String, [Info])]
            }
            struct Failure {
                let message: String
            }
        }
    }
}
