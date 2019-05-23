//
//  MoviesService.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

class MoviesService{
    
    let SourceName = "movies"
    let SourceType = "json"
    
    func getMovies() -> [Movie]?{
        var movies = [Movie]()
        guard let path = Bundle.main.path(forResource: SourceName, ofType: SourceType) else {return nil}
        
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let moviesDTO = try JSONDecoder().decode(MoviesDTO.self, from: data)
            movies = moviesDTO.movies
        } catch let error {
            print("error", error)
        }
        return movies
    }
    
}
