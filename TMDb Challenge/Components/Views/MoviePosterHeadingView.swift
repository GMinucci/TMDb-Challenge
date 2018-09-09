//
//  MoviePosterHeadingView.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

class MoviePosterHeadingView: UIView {

    // UI Components
    let backdropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var backdropGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        return gradient
    }()
    
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
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieGenreLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie Genre"
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUIComponents()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backdropGradient.frame = backdropImageView.bounds
        let gradientStartLocation = NSNumber(value: Float(movieTitleLabel.frame.origin.y/frame.size.height))
        backdropGradient.locations = [0, gradientStartLocation]
        backdropImageView.layer.mask = backdropGradient
    }
    
    private func setupUIComponents() {
        backgroundColor = .clear
        
        addSubview(backdropImageView)
        backdropImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backdropImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backdropImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backdropImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(posterImageView)
        posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        posterImageView.heightAnchor.constraint(lessThanOrEqualTo: posterImageView.widthAnchor, multiplier: 3/2).isActive = true
        posterImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        addSubview(movieGenreLabel)
        movieGenreLabel.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: -16).isActive = true
        movieGenreLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 16).isActive = true
        movieGenreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        movieGenreLabel.sizeToFit()
        
        addSubview(movieTitleLabel)
        movieTitleLabel.bottomAnchor.constraint(equalTo: movieGenreLabel.topAnchor, constant: -5).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 16).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        movieTitleLabel.sizeToFit()
    }

}
