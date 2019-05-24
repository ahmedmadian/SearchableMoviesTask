//
//  MovieDetailViewController.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/24/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, MovieDetailViewProtocol{
    
    
    //MARK: Properties
    static let ViewControllerStoryboardId = "MovieDetailViewController"
    var presenter: MovieDetailPresenterProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
