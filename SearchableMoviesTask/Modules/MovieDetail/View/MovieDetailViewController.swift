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
    
    
    //MARK: Outlets.
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genresLable: UILabel!
    @IBOutlet weak var castLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        presenter?.viewDidLoad()
        
    }
    
    func setupNavigationItem(){
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Detail"
    }

}
