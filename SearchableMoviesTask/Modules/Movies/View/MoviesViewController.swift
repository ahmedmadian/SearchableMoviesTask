//
//  MoviesViewController.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, MoviesViewProtocol {
    
    //MARK: Properties
    static let ViewControllerId = "MoviesViewController"
    var presenter: MoviesPresenterProtocol?
    var isSearching = false

    // MARK: Outlets.
    @IBOutlet weak var moviesTableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: Controller Events
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        setupSearchBar()
        setupMoviesTableView()
        presenter?.viewDidLoad()
    }
    
    //MARK: Methods
    func reloadData() {
        moviesTableView.reloadData()
    }
}


// MARK: Movies Table View Configuraions.

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setupMoviesTableView(){
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            print(presenter!.numberOfCurrentSearchedRows)
            return presenter!.numberOfCurrentSearchedRows
        } else {
            print(presenter!.numberOfOriginalRows)
            return presenter!.numberOfOriginalRows
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.CellId, for: indexPath) as! MovieTableViewCell
        presenter?.configure(cell: cell, indexPath: indexPath)
        return cell
    }
}

// MARK: Search Controller Extension
extension MoviesViewController: UISearchControllerDelegate{
    func setupSearchController() {
        searchController.delegate = self
    }
}

// MARK: Search Bar Delegate
extension MoviesViewController: UISearchBarDelegate{
    func setupSearchBar(){
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = true
        presenter?.viewDidSearch(by: searchText)
    }
    
    
    
}



