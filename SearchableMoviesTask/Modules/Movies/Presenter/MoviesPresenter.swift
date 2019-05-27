//
//  MoviesPresenter.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

class MoviesPresenter: MoviesPresenterProtocol {
    
    
    
       //MARK: Properties.
    weak var view: MoviesViewProtocol?
    var originalMovies = [Movie]()
    var isSearching = false
    var sections = [Int]()
    var groupedRows = [[Movie]]()
    private let interactor: MoviesInteractorInputProtocol
    private let router: MoviesRouterProtocol
    
    init(view: MoviesViewProtocol, interactor: MoviesInteractorInputProtocol, router: MoviesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: Methods.
    func viewDidLoad() {
        interactor.getMovies()
    }
    
    func numberOfSearchedSections() -> Int {
        if isSearching{
            return sections.count
        } else {
            
            //TODO
            return 1
        }
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        if isSearching {
            return groupedRows[section].count
        } else {
            return originalMovies.count
        }
    }
    
    func configure(cell: MoviesCellViewProtocol, indexPath: IndexPath) {
        var movie: Movie
        if isSearching{
            movie = self.groupedRows[indexPath.section][indexPath.row]
        } else{
            movie = self.originalMovies[indexPath.row]
        }
        let viewModel = MovieViewModel(title: movie.title, rating: movie.rating)
        cell.configure(viewModel: viewModel)
    }
    
    func titleForSectionHeader(section: Int) -> String {
        if isSearching{
            return "\(sections[section])"
        } else {
            return ""
        }
    }
    
    func viewDidSearch(by searchText: String) {
        isSearching = true
        interactor.getFilteredMovies(in: originalMovies, by: searchText)
    }
    
    func searchCanceled() {
        isSearching = false
        interactor.getMovies()
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        var movie: Movie
        if isSearching{
            movie = self.groupedRows[indexPath.section][indexPath.row]
        } else{
            movie = self.originalMovies[indexPath.row]
        }

        self.router.openMovieDetailView(movie: movie)
    }
    
    
}

//MARK: Interactor Output to presenter
extension MoviesPresenter : MoviesInteractorOutputProtocol {
   
    
    func moviesFetechedSuccessfully(movies: [Movie]) {
        self.originalMovies = movies
        view?.reloadData()
    }
    
    func filterdMoviesFetechedSuccessfully(with years: [Int], groupedMovies: [[Movie]]) {
        self.sections = years
        self.groupedRows = groupedMovies
        view?.reloadData()
    }
    
    
    
    
}
