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
    var movies = [Movie]()
    var searchedMovies = [Movie]()
    var isSearching = false
    
    var numberOfOriginalRows: Int {
        return movies.count
    }
    
    var numberOfCurrentSearchedRows: Int{
        return searchedMovies.count
    }
    
    // presenter owns interactor and ask for updates
    private let interactor: MoviesInteractorInputProtocol
    
    // presenter own router
    private let router: MoviesRouterProtocol
    
    init(view: MoviesViewProtocol, interactor: MoviesInteractorInputProtocol, router: MoviesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: Methods.
    func viewDidLoad() {
        print("Presenter Should get the data")
        interactor.getMovies()
    }
    
    func viewDidSearch(by searchText: String) {
        print("Presenter Should Get the Searched data")
        isSearching = true
        interactor.getFilteredMovies(in: movies, by: searchText)
    }
    
    
    func moviesFetechedSuccessfully(movies: [Movie]) {
        if isSearching{
            print("Data comed")
            self.searchedMovies = movies
        } else {
            print("Data comed")
            self.movies = movies
        }
        
        view?.reloadData()
    }
    
    func configure(cell: MoviesCellViewProtocol, indexPath: IndexPath) {
        var movie: Movie
        if isSearching {
            movie = self.searchedMovies[indexPath.row]
        } else {
            movie = self.movies[indexPath.row]
        }
        let viewModel = MoviesViewModel(title: movie.title, year: movie.year)
        cell.configure(viewModel: viewModel)
        
    }
    
    
}
