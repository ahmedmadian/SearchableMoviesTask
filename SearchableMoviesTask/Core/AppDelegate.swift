//
//  AppDelegate.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navController = UINavigationController(rootViewController: MoviesRouter.create())
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        
        window?.rootViewController = navController
        
       
        return true
    }



}

