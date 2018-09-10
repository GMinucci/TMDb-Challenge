//
//  LoadingView.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    // UI Components
    let loadingSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.activityIndicatorViewStyle = .whiteLarge
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUIComponents()
    }
    
    private func setupUIComponents() {
        backgroundColor = UIColor.tmdb.primaryDark
        
        addSubview(loadingSpinner)
        loadingSpinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingSpinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
