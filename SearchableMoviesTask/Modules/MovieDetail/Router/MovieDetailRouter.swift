//
//  MovieDetailRouter.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/24/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit
class MovieDetailRouter: MovieDetailRouterProtocol{
    
    var viewController: UIViewController?
    
    //Create Movies Module
    static func create() -> UIViewController{
        
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: MovieDetailViewController.ViewControllerStoryboardId) as! MovieDetailViewController
        
        let interactor = MovieDetailInteractor()
        
        let router = MovieDetailRouter()
        
        let presenter = MovieDetailPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
        
    }
}
