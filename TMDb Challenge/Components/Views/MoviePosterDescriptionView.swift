//
//  MoviePosterDescriptionView.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

class MoviePosterDescriptionView: UIView {

    // UI Components
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie Title"
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.tmdb.primaryTextColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie Description"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.tmdb.secondaryTextColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUIComponents() {
        backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        
        addSubview(posterImageView)
        posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        posterImageView.widthAnchor.constraint(equalTo: posterImageView.heightAnchor, multiplier: 2/3).isActive = true
        
        addSubview(movieTitleLabel)
        movieTitleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 16).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        movieTitleLabel.sizeToFit()
        
        addSubview(movieDescriptionLabel)
        movieDescriptionLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 5).isActive = true
        movieDescriptionLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor).isActive = true
        movieDescriptionLabel.trailingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor).isActive = true
        movieDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: posterImageView.bottomAnchor).isActive = true
        movieDescriptionLabel.sizeToFit()
    }

}
