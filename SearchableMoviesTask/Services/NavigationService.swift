//
//  NavigationService.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/24/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit
class NavigationService{
   // static var navController: UINavigationController!
    
    static func setupNavigationController() -> UINavigationController{
        let navController = UINavigationController(rootViewController: MoviesRouter.create())
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        navController.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);

        return navController
    }
    
    
}
