//
//  MoviesPresenterProtocol.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

protocol MoviesPresenterProtocol: class {
    
    // presenter should update view
    var view: MoviesViewProtocol? {get set}
    func numberOfSearchedSections() -> Int
    func numberOfRowsIn(section: Int) -> Int
    func titleForSectionHeader(section: Int) -> String
    func viewDidLoad()
    func viewDidSearch(by searchText: String)
    func searchCanceled()
    func didSelectRow(at indexPath: IndexPath)
    func configure(cell: MoviesCellViewProtocol, indexPath: IndexPath)
    
}
