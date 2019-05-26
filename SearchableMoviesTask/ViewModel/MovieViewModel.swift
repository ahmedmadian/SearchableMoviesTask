//
//  MovieViewModel.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

struct MovieViewModel {
    var title: String
    var rating: Int
    var year: String
    var genres: String
    var cast: String
    
    init(title: String, rating: Int, year: String, genres: String, cast:String) {
        self.title  = title
        self.rating = rating
        self.year = year
        self.genres = genres
        self.cast = cast
    }
    
    init(title: String, rating: Int) {
        self.init(title: title, rating: rating, year: "", genres: "", cast: "")
    }
    
}
