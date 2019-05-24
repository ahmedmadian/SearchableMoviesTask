//
//  MovieDetailInteractorInputProtocol.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/24/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation
protocol MovieDetailInteractorInputProtocol {
    //Interactor notifies any one intersted for changes
    var presenter: MovieDetailInteractorOutputProtocol? {get set}
}
