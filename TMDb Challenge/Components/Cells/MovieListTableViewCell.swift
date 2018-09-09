//
//  MovieListTableViewCell.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 08/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "MovieListTableViewCell"

    // UI elements
    let cardContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    let backdropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieDataView: MoviePosterDescriptionView = {
        let view = MoviePosterDescriptionView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Cell initialization
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUIComponents() {
        selectionStyle = .none
        backgroundColor = .clear
                
        addSubview(cardContainer)
        cardContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        cardContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        cardContainer.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        cardContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        cardContainer.addSubview(backdropImageView)
        backdropImageView.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor).isActive = true
        backdropImageView.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor).isActive = true
        backdropImageView.topAnchor.constraint(equalTo: cardContainer.topAnchor).isActive = true
        backdropImageView.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor).isActive = true
        
        cardContainer.addSubview(movieDataView)
        movieDataView.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor).isActive = true
        movieDataView.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor).isActive = true
        movieDataView.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor).isActive = true
        movieDataView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }

}
