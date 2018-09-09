//
//  MovieListModel.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import Foundation

struct MovieListResultsPageModel: Decodable {
    let page: Int
    let results: [MovieListModel]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieListModel: Decodable {
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
    let releaseDate: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
        case title
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case releaseDate = "release_date"
    }
}
