//
//  MoviesInteractorInputProtocol.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

protocol MoviesInteractorInputProtocol {
    
    //Interactor notifies presenter
    var presenter: MoviesPresenterProtocol {get set}
}
