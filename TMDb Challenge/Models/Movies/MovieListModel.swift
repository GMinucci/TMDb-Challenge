//
//  MovieListModel.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import Foundation

struct MovieListModel {
    let id: Int
    let voteCount: Int
    let video: Bool
    let voteAverage: Float
    let title: String
    let popularity: Float
    let posterPath: String?
    let originalLanguage: String
    let originalTitle: String
    let genreIds: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview: String
}
