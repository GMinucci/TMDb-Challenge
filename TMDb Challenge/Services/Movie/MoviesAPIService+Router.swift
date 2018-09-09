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
        case list(page: Int?)
        case detail(id: Int)
        
        var method: HTTPMethod {
            switch self {
            case .list:
                return .get
            case .detail:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .list:
                return "movie/upcoming"
            case .detail(let id):
                return "movie/\(id)"
            }
        }
        
        var parameters: Parameters? {
            switch self {
            case .list(let page):
                var params = ["language": "en-US"]
                if let safePage = page {
                    params.updateValue("\(safePage)", forKey: "page")
                }
                return params
            case .detail:
                return nil
            }
        }
        
        var body: Parameters? {
            switch self {
            case .list:
                return nil
            case .detail:
                return nil
            }
        }
        
    }
    
}
