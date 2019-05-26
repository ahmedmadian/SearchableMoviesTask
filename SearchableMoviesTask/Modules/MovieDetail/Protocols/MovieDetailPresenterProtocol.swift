//
//  MovieDetailPresenterProtocol.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/24/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation
protocol MovieDetailPresenterProtocol: class {
    
    // presenter should update view
    var view: MovieDetailViewProtocol? {get set}
    
    var numberOfImages: Int {get}
    func viewDidLoad()
    func configure(cell: MovieImageCollectionViewCell, indexPath: IndexPath)
}
