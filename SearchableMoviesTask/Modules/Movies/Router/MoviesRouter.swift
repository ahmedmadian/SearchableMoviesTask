//
//  MoviesRouter.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit

///
/// Router is responsible for creating the module , push, pop moduls, creating aleart
///

class MoviesRouter: MoviesRouterProtocol {
    
    var viewController: UIViewController?
    
    //Create Movies Module
    static func create() -> UIViewController{
        
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: MoviesViewController.ViewControllerStoryboardId) as! MoviesViewController
        
        let interactor = MoviesInteractor()
        
        let router = MoviesRouter()
        
        let presenter = MoviesPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
        
    }
    
    func openMovieDetailView(movie: Movie){
        let movieDetailView = MovieDetailRouter.create(movie: movie)
        viewController?.navigationController?.pushViewController(movieDetailView, animated: true)
        
    }
}
