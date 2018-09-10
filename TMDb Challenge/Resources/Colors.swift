//
//  Colors.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

extension UIColor {
    struct tmdb {
        static let primaryTextColor: UIColor = {
            return UIColor.white
        }()
        
        static let secondaryTextColor: UIColor = {
            return UIColor(red: 161/255, green: 162/255, blue: 162/255, alpha: 1)
        }()
        
        static let primaryDark: UIColor = {
            return UIColor(red: 8/255, green: 28/255, blue: 36/255, alpha: 1)
        }()
        
        static let secondaryDark: UIColor = {
            return UIColor(red: 31/255, green: 45/255, blue: 55/255, alpha: 1)
        }()
        
        static let primaryGreen: UIColor = {
            return UIColor(red: 1/255, green: 210/255, blue: 119/255, alpha: 1)
        }()
    }
}
