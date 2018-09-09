//
//  MovieSearchViewController+SearchBar.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

extension MovieSearchViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.searchBar.barStyle = .blackTranslucent
        searchController.searchBar.keyboardAppearance = .dark
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.titleView = searchController.searchBar
        searchController.searchBar.placeholder = "Search for movies"
        definesPresentationContext = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showLoading(delayed: 0.1)
        let request = MovieSearch.Search.Request(mode: .load, query: searchBar.text ?? "")
        interactor?.searchMovie(request: request)
    }
    
}
