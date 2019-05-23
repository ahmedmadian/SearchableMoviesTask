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
    var numberOfRows: Int {get}
    func viewDidLoad()
    func configure(cell: MoviesCellViewProtocol, indexPath: IndexPath)
    
}
