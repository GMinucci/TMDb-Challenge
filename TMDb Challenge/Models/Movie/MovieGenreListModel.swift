//
//  MovieGenreListModel.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import Foundation

struct MovieGenreListModel: Decodable {
    let genres: [MovieDetailModel.Genre]
}
