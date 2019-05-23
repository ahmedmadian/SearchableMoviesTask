//
//  MoviesViewController.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    // MARK: Outlets.
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    //MARK: Controller Events
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMoviesTableView()
    }
}


// MARK: Movies Table View Configuraions.

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setupMoviesTableView(){
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.CellId, for: indexPath)
        return cell
    }
}


