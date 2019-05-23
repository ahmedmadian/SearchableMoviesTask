//
//  MoviesPresenter.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

class MoviesPresenter: MoviesPresenterProtocol, MoviesInteractorOutputProtocol {
    
    //MARK: Properties.
    
    weak var view: MoviesViewProtocol?
    
    // presenter owns interactor and ask for updates
    private let interactor: MoviesInteractorInputProtocol
    
    // presenter own router
    private let router: MoviesRouterProtocol
    
    init(view: MoviesViewProtocol, interactor: MoviesInteractorInputProtocol, router: MoviesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
}
