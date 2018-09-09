//
//  MoviesAPIService+Router.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import Foundation
import Alamofire

extension MoviesAPIService {
    
    enum MoviesRouter: MoviesAPIGenericRouter {
        case list(page: Int)
        case detail(id: Int)
        case search(query: String, page: Int)
        
        var method: HTTPMethod {
            switch self {
            case .list:
                return .get
            case .detail:
                return .get
            case .search:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .list:
                return "movie/upcoming"
            case .detail(let id):
                return "movie/\(id)"
            case .search:
                return "search/movie"
            }
        }
        
        var parameters: Parameters? {
            switch self {
            case .list(let page):
                return [
                    "language": "en-US",
                    "page": "\(page)"
                ]
            case .detail:
                return nil
            case .search(let query, let page):
                return [
                    "language": "en-US",
                    "query": query,
                    "page": "\(page)"
                ]
            }
        }
        
        var body: Parameters? {
            switch self {
            case .list:
                return nil
            case .detail:
                return nil
            case .search:
                return nil
            }
        }
        
    }
    
}
