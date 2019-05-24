//
//  MoviesInteractorInputProtocol.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

protocol MoviesInteractorInputProtocol {
    
    //Interactor notifies any one intersted for changes
    var presenter: MoviesInteractorOutputProtocol? {get set}
    
    func getMovies()
    
    func getFilteredMovies(in movies: [Movie], by searchText: String)
}
