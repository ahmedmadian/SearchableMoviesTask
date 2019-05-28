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

    var imageURLS = [String](){
        didSet{
            view?.reloadData()
        }
    }
    var numberOfImages: Int {
        return imageURLS.count
    }
    
    weak var view: MovieDetailViewProtocol?
    private let interactor: MovieDetailInteractorInputProtocol
    private let router: MovieDetailRouterProtocol
    
    
    init(view: MovieDetailViewProtocol, interactor: MovieDetailInteractorInputProtocol, router: MovieDetailRouterProtocol, movie: Movie){
        self.view = view
        self.interactor = interactor
        self.router = router
        self.movie = movie
    }
    
    //MARK: Methods
    
    func viewDidLoad() {
        interactor.executeToGetImagesURL(with: movie)
        let movieViewModel = MovieViewModel(title: movie.title, rating: movie.rating, year: "\(movie.year)", genres: movie.genres.joined(separator: ", "), cast: movie.cast.joined(separator: ", "))
        view?.config(with: movieViewModel)
    }
    
    func moviesFetechedSuccessfully(with imageURLS: [String]) {
        print(imageURLS)
        self.imageURLS = imageURLS
    }
    
    func configure(cell: MovieImageCollectionViewCell, indexPath: IndexPath) {
        let viewModel = MovieImagesViewModel(imageURl: imageURLS[indexPath.row])
        cell.configure(viewModel: viewModel)
    }
    
}
