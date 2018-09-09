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

    let movieDataView: MoviePosterDescriptionView = {
        let view = MoviePosterDescriptionView(frame: .zero)
        view.backgroundColor = .clear
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
        
        addSubview(movieDataView)
        movieDataView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        movieDataView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        movieDataView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        movieDataView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

}
