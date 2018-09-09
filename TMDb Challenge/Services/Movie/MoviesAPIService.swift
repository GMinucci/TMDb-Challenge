//
//  MoviesAPIService.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class MoviesAPIService: SessionManager {
    
    static let baseDomain = "https://api.themoviedb.org/"
    static let apiEndpoint = "3/"
    static let apiKey = "1f54bd990f1cdfb230adb312546d765d"
    static let session = MoviesAPIService()
    
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        self.init(configuration: configuration)
    }
    
    // Router
    private enum MoviesRouter: MoviesAPIGenericRouter {
        case list(page: Int?)
        
        var method: HTTPMethod {
            switch self {
            case .list:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .list:
                return "movie/upcoming"
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
            }
        }
        
        var body: Parameters? {
            switch self {
            case .list:
                return nil
            }
        }
        
    }
    
    // Methods
    static func getUpcomingMovies(page: Int?) -> Promise<MovieListResultsPageModel> {
        return Promise.init { seal in
            
            let request = MoviesRouter.list(page: page)
            MoviesAPIService.session.request(request).responseJSON(completionHandler: { response in
                guard let statusCode = response.response?.statusCode else {
                    let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't get response status code from the API"])
                    seal.reject(error)
                    return
                }
                
                switch statusCode {
                case 200:
                    do {
                        guard let responseDict = response.result.value as? [String: Any] else {
                            let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't parse the response from the API"])
                            seal.reject(error)
                            return
                        }
                        
                        let jsonData = try JSONSerialization.data(withJSONObject: responseDict, options: .prettyPrinted)
                        let value = try JSONDecoder().decode(MovieListResultsPageModel.self, from: jsonData)
                        seal.fulfill(value)
                    }
                    catch let error {
                        seal.reject(error)
                    }
                case 401, 404:
                    guard let responseDict = response.result.value as? [String: Any] else {
                        let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't parse the response from the API"])
                        seal.reject(error)
                        return
                    }
                    let errorMessage = responseDict["status_message"] as? String ?? "Couldn't paarse any error message"
                    let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                    seal.reject(error)
                default:
                    let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't get any response from the API"])
                    seal.reject(error)
                }
            })
            
        }
    }
}
