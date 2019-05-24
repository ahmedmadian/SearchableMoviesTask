//
//  MoviesInteractor.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

class MoviesInteractor: MoviesInteractorInputProtocol{
    
    
    
    
    var presenter: MoviesInteractorOutputProtocol?
    
    private let moviesWorker = MoviesWorker()
    
    func getMovies() {
        print("Interactor should get the data")
        guard let movies = moviesWorker.getMovies() else{ return}
        presenter?.moviesFetechedSuccessfully(movies: movies)
    }
    
    func getFilteredMovies(in movies: [Movie], by searchText: String) {
        print("Interactor should get the Filtered data")
        guard let movies = moviesWorker.getFilteredMovies(in: movies, by: searchText) else{ return}
        presenter?.moviesFetechedSuccessfully(movies: movies)
    }
    
}
