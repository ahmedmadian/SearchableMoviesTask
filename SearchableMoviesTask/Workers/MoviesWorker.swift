//
//  MoviesWorker.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

class MoviesWorker {
    private let moviesService = MoviesService()
    private let moviesFilterService = MoviesFilterService()
    
    func getMovies() -> [Movie]? {
        return moviesService.getMovies()
    }
    
    func getFilteredMovies(in movies: [Movie], by searchText: String) -> [(key: Int, value: [Movie])]? {
        return moviesFilterService.getFilteredMovies(movies: movies, searchText: searchText)
    }
}
