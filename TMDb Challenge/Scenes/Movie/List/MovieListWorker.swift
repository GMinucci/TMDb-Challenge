//
//  MovieListWorker.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright (c) 2018 Minucci. All rights reserved.
//

import UIKit
import PromiseKit

class MovieListWorker {

    func getUpcomingMovies(page: Int?) -> Promise<[MovieListModel]> {
        return Promise.init { seal in
            let movies = [
                MovieListModel(id: 439079, voteCount: 78, video: false, voteAverage: 6.3, title: "The Nun", popularity: 122.108, posterPath: "/sFC1ElvoKGdHJIWRpNB3xWJ9lJA.jpg", originalLanguage: "en", originalTitle: "The Nun", genreIds: [], backdropPath: "/fgsHxz21B27hOOqQBiw9L6yWcM7.jpg", adult: false, overview: "When a young nun at a cloistered abbey in Romania takes her own life, a priest with a haunted past and a novitiate on the threshold of her final vows are sent by the Vatican to investigate. Together they uncover the order’s unholy secret. Risking not only their lives but their faith and their very souls, they confront a malevolent force in the form of the same demonic nun that first terrorized audiences in “The Conjuring 2,” as the abbey becomes a horrific battleground between the living and the damned.", releaseDate: "2018-09-05"),
                MovieListModel(id: 447200, voteCount: 597, video: false, voteAverage: 6, title: "Skyscraper", popularity: 72.661, posterPath: "/5LYSsOPzuP13201qSzMjNxi8FxN.jpg", originalLanguage: "en", originalTitle: "Skyscraper", genreIds: [], backdropPath: "/oMKFQmoVgB69fyXfSMu0lGlHJP2.jpg", adult: false, overview: "Framed and on the run, a former FBI agent must save his family from a blazing fire in the world's tallest building.", releaseDate: "2018-06-14"),
                MovieListModel(id: 489999, voteCount: 51, video: false, voteAverage: 7.5, title: "Searching", popularity: 38.668, posterPath: "/9N0T3BaHZNdUCcMZQIM3yMUFwEh.jpg", originalLanguage: "en", originalTitle: "Searching", genreIds: [], backdropPath: "/1q5AauYD1szopz5qnd6qqxnpTHG.jpg", adult: false, overview: "After his 16-year-old daughter goes missing, a desperate father breaks into her laptop to look for clues to find her. A thriller that unfolds entirely on computer screens.", releaseDate: "2018-08-24")
            ]
            seal.fulfill(movies)
        }
    }
    
}
