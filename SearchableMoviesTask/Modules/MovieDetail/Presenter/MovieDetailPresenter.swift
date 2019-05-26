//
//  MovieDetailPresenter.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/24/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation
class MovieDetailPresenter: MovieDetailPresenterProtocol, MovieDetailInteractorOutputProtocol {
    
    
    
    
    //MARK: Properties.
    var movie: Movie
    weak var view: MovieDetailViewProtocol?
    private let interactor: MovieDetailInteractorInputProtocol
    private let router: MovieDetailRouterProtocol
    
    
    init(view: MovieDetailViewProtocol, interactor: MovieDetailInteractorInputProtocol, router: MovieDetailRouterProtocol, movie: Movie){
        self.view = view
        self.interactor = interactor
        self.router = router
        self.movie = movie
        print("Movie Detail Presenter: \(movie.title)")
    }
    
    //MARK: Methods
    
    func viewDidLoad() {
        interactor.executeToGetImagesURL(with: movie)
    }
    
    func moviesFetechedSuccessfully(with imageURLS: [String]) {
        print(imageURLS)
    }
}
