//
//  MovieDetailModel.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import Foundation

struct MovieDetailModel {
    let adult: Bool
    let backdropPath: String?
    let budget: Int
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let imdbId: String?
    let originalLanguage: String
    let originalTitle: String
    let overview: String?
    let popularity: Float
    let posterPath: String?
    let productionCompanies: [Company]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue: Int
    let runtime: Int?
    let spokenLanguages: [SpokenLanguage]
    let status: String
    let tagline: String?
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case homepage
        case id
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    // MARK: Child decodable properties
    struct Genre: Decodable {
        let id: Int
        let name: String
    }
    
    struct Company: Decodable {
        let name: String
        let id: Int
        let logoPath: String?
        let originCountry: String
        
        private enum CodingKeys: String, CodingKey {
            case name
            case id
            case logoPath = "logo_path"
            case originCountry = "origin_country"
        }
    }
    
    struct ProductionCountry: Decodable {
        let iso: String
        let name: String
        
        private enum CodingKeys: String, CodingKey {
            case iso = "iso_3166_1"
            case name
        }
    }
    
    struct SpokenLanguage: Decodable {
        let iso: String
        let name: String
        
        private enum CodingKeys: String, CodingKey {
            case iso = "iso_639_1"
            case name
        }
    }
    
}
