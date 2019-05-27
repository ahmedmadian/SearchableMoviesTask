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
    static let ViewControllerStoryboardId = "MoviesViewController"
    var presenter: MoviesPresenterProtocol?

    // MARK: Outlets.
    @IBOutlet weak var moviesTableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: Controller Events
    override func viewDidLoad() {
        super.viewDidLoad()
        //searchController.dimsBackgroundDuringPresentation = false
        //navigationItem.searchController = searchController
        setupSearchController()
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter!.numberOfSearchedSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "\(presenter!.titleForSectionHeader(section: section))"
        label.backgroundColor = #colorLiteral(red: 0.9126773477, green: 0.9126773477, blue: 0.9126773477, alpha: 1)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Avenir", size: 30.0)
        label.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.CellId, for: indexPath) as! MovieTableViewCell
        presenter?.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath)
    }
}


// MARK: Search Bar Delegate
extension MoviesViewController: UISearchBarDelegate{
    func setupSearchController(){
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.viewDidSearch(by: searchText)
    }
    
}



