//
//  MoviesAPICodableParser.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import Foundation

class DecodableParser<T: Decodable> {
    
    static func parse(dict: Any?) throws -> T {
        guard let safeDict = dict as? [String: Any] else {
            throw NSError(domain: "DecodableParser", code: -1, userInfo: [NSLocalizedDescriptionKey: "Can't parse nil dictionary"])
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: safeDict, options: .prettyPrinted)
            let value = try JSONDecoder().decode(T.self, from: jsonData)
            return value
        }
        catch let error {
            throw error
        }
    }
    
}
