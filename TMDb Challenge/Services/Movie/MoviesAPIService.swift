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
    
    // Constants
    static let baseDomain = "https://api.themoviedb.org/"
    static let apiEndpoint = "3/"
    static let apiKey = "1f54bd990f1cdfb230adb312546d765d"
    
    static let session = MoviesAPIService()
    
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        self.init(configuration: configuration)
    }
    
    // MARK: Methods
    static func parseErrorResponse(dict: Any?) -> NSError {
        // Convenience parser for API default error responses
        guard let responseDict = dict as? [String: Any] else {
            let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't parse the response from the API"])
            return error
        }
        let errorMessage = responseDict["status_message"] as? String ?? "Couldn't paarse any error message"
        let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage])
        return error
    }
    
    static func getUpcomingMovies(page: Int) -> Promise<MovieListResultsPageModel> {
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
                        let parsedResult = try DecodableParser<MovieListResultsPageModel>.parse(dict: response.result.value)
                        seal.fulfill(parsedResult)
                    }
                    catch let error {
                        seal.reject(error)
                    }
                case 401, 404:
                    let error = parseErrorResponse(dict: response.result.value)
                    seal.reject(error)
                default:
                    let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't get any response from the API"])
                    seal.reject(error)
                }
            })
        }
    }
    
    static func getMovieDetail(id: Int) -> Promise<MovieDetailModel> {
        return Promise.init { seal in
            let request = MoviesRouter.detail(id: id)
            MoviesAPIService.session.request(request).responseJSON(completionHandler: { response in
                guard let statusCode = response.response?.statusCode else {
                    let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't get response status code from the API"])
                    seal.reject(error)
                    return
                }
                switch statusCode {
                case 200:
                    do {
                        let parsedResult = try DecodableParser<MovieDetailModel>.parse(dict: response.result.value)
                        seal.fulfill(parsedResult)
                    }
                    catch let error {
                        seal.reject(error)
                    }
                case 401, 404:
                    let error = parseErrorResponse(dict: response.result.value)
                    seal.reject(error)
                default:
                    let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't get any response from the API"])
                    seal.reject(error)
                }
            })
            
        }
    }
    
    static func searchMovie(query: String, page: Int) -> Promise<MovieListResultsPageModel> {
        return Promise.init { seal in
            let request = MoviesRouter.search(query: query, page: page)
            MoviesAPIService.session.request(request).responseJSON(completionHandler: { response in
                guard let statusCode = response.response?.statusCode else {
                    let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't get response status code from the API"])
                    seal.reject(error)
                    return
                }
                switch statusCode {
                case 200:
                    do {
                        let parsedResult = try DecodableParser<MovieListResultsPageModel>.parse(dict: response.result.value)
                        seal.fulfill(parsedResult)
                    }
                    catch let error {
                        seal.reject(error)
                    }
                case 401, 404:
                    let error = parseErrorResponse(dict: response.result.value)
                    seal.reject(error)
                default:
                    let error = NSError(domain: "MoviesAPIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't get any response from the API"])
                    seal.reject(error)
                }
            })
        }
    }
}
