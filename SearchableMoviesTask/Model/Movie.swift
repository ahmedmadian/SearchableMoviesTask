//
//  Movie.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let title: String
    let year: Int
    let cast: [String]
    let genres: [Genre]
    let rating: Int
}
