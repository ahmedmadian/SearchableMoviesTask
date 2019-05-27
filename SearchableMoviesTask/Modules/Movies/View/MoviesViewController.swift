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
         moviesTableView.sectionHeaderHeight = 50
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
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        label.font = UIFont(name: "Avenir", size: 30.0)
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
        searchController.searchBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            presenter?.searchCanceled()
        } else {
            presenter?.viewDidSearch(by: searchText)
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.searchCanceled()
    }
    
}



