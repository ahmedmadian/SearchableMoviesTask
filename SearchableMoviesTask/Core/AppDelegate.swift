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
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nav: UINavigationController = storyBoard.instantiateViewController(withIdentifier: "Nav") as! UINavigationController
        
        window?.rootViewController = navController
        
       
        return true
    }



}

