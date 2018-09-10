//
//  MoviesAPIGenericRouter.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import Foundation
import Alamofire

protocol MoviesAPIGenericRouter: Alamofire.URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var body: Parameters? { get }
}

extension MoviesAPIGenericRouter {
    
    func asURLRequest() throws -> URLRequest {
        let url = try (MoviesAPIService.baseDomain + MoviesAPIService.apiEndpoint).asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        var params = parameters ?? [:]
        params.updateValue(MoviesAPIService.apiKey, forKey: "api_key")
        urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        
        if let safeBody = body {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: safeBody, options: [])
        }
        
        return urlRequest
    }
    
}
