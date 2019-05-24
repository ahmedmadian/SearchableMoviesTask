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
    
    func numberOfSearchedSections() -> Int {
        if isSearching{
            print("Sections in Presenter = \(sections.count)")
            return sections.count
        } else {
            print("sections in preseter = default = 1")
            return 1
        }
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        if isSearching {
            print("Rows Count in section \(sections[section]) = \(groupedRows[section].count)")
            return groupedRows[section].count
        } else {
            print(originalMovies.count)
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
        let viewModel = MoviesViewModel(title: movie.title, year: movie.year,  rating: movie.rating)
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
        print("Presenter Start Searching ....")
        isSearching = true
        interactor.getFilteredMovies(in: originalMovies, by: searchText)
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        self.router.openMovieDetailView()
        
    }
    
    
}

//MARK: Interactor Output to presenter
extension MoviesPresenter : MoviesInteractorOutputProtocol {
   
    
    func moviesFetechedSuccessfully(movies: [Movie]) {
        print("Data comed")
        self.originalMovies = movies
        view?.reloadData()
    }
    
    func filterdMoviesFetechedSuccessfully(with years: [Int], groupedMovies: [[Movie]]) {
        print("presenter got the data sorted and modified")
        
        //isSearching = false
        self.sections = years
        self.groupedRows = groupedMovies
        print("Years in presenter = \(years)")
        view?.reloadData()
    }
    
    
    
    
}
