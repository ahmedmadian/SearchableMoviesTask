//
//  MovieDetailViewProtocol.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/24/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation
protocol MovieDetailViewProtocol: class {
    
    //View Owns and send user action to presenter
    var presenter: MovieDetailPresenterProtocol? {get set}
    func config(with movieViewModel: MovieViewModel)
    func reloadData()
}
