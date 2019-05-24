//
//  MoviesInteractorOutputProtocol.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

protocol MoviesInteractorOutputProtocol {
    func moviesFetechedSuccessfully(movies: [Movie])
    func filterdMoviesFetechedSuccessfully(with years:[Int], groupedMovies: [[Movie]])
}
