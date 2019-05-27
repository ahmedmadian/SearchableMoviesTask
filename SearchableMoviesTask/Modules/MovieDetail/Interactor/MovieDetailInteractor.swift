//
//  MovieDetailInteractor.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/24/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation
class MovieDetailInteractor: MovieDetailInteractorInputProtocol {
   
    private let movieImagesWorker = MovieImagesURLWorker()
    var imagesURL = [String]() {
        didSet{
            presenter?.moviesFetechedSuccessfully(with: self.imagesURL)
        }
    }
    
    var presenter: MovieDetailInteractorOutputProtocol?
    
    func executeToGetImagesURL(with movie: Movie) {
        movieImagesWorker.execute(with: movie) { (data) in
            self.imagesURL = (data ?? []).map{ $0.imageUrl }
        }
    }
}
