//
//  MoviesViewProtocol.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

protocol MoviesViewProtocol: class {
    
    //View Owns and send user action to presenter
    var presenter: MoviesPresenterProtocol? {get set}
    func reloadData()
}
