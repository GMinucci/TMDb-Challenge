//
//  MovieDetailViewController+TableView.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorColor = UIColor.tmdb.secondaryDark
        tableView.isScrollEnabled = false
        tableView.register(MovieInfoTableViewCell.self, forCellReuseIdentifier: MovieInfoTableViewCell.reuseIdentifier)
        tableView.rowHeight = 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieInfo.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard movieInfo.count > section else { return 0 }
        let (_, values) = movieInfo[section]
        return values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.reuseIdentifier, for: indexPath) as? MovieInfoTableViewCell else {
            return UITableViewCell()
        }
        // Make sure that the movieInfo list has all indexes before accessing
        guard movieInfo.count > indexPath.section else {
            return cell
        }
        let (_, values) = movieInfo[indexPath.section]
        guard values.count > indexPath.row else {
            return cell
        }
        let info = values[indexPath.row]
        cell.titleLabel.text = info.title
        cell.descriptionLabel.text = info.description
        if info.urlAction != nil {
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MovieInfoTableHeaderView()
        guard movieInfo.count > section else { return header }
        let (sectionTitle, _) = movieInfo[section]
        header.titleLabel.text = sectionTitle
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        // Make sure that the movieInfo list has all indexes before accessing
        guard movieInfo.count > indexPath.section else { return }
        let (_, values) = movieInfo[indexPath.section]
        guard values.count > indexPath.row else { return }
        let info = values[indexPath.row]
        guard let actionURL = info.urlAction else { return }
        UIApplication.shared.open(actionURL, options: [:], completionHandler: nil)
    }
    
}
