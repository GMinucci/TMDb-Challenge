//
//  TMDbNavigationBar.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

class TMDbNavigationBar: UINavigationBar {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    func setupLayout() {
        prefersLargeTitles = true
        barTintColor = UIColor.tmdb.primaryDark
        tintColor = UIColor.tmdb.primaryGreen
        let titleAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.tmdb.primaryGreen
        ]
        largeTitleTextAttributes = titleAttributes
        titleTextAttributes = titleAttributes
    }
}
