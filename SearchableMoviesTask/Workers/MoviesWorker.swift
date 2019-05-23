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
    
    func getMovies() -> [Movie]? {
        return moviesService.getMovies()
    }
}
