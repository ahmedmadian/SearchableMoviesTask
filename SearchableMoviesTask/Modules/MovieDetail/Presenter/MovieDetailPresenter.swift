//
//  MovieDetailPresenter.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/24/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation
class MovieDetailPresenter: MovieDetailPresenterProtocol, MovieDetailInteractorOutputProtocol {
    
    weak var view: MovieDetailViewProtocol?
    // presenter owns interactor and ask for updates
    private let interactor: MovieDetailInteractorInputProtocol
    // presenter own router
    private let router: MovieDetailRouterProtocol
    
    
    init(view: MovieDetailViewProtocol, interactor: MovieDetailInteractorInputProtocol, router: MovieDetailRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
