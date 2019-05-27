//
//  MovieDetailViewController.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/24/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit
import Kingfisher


class MovieDetailViewController: UIViewController, MovieDetailViewProtocol{
    
    
    
    
        
    //MARK: Properties
    static let ViewControllerStoryboardId = "MovieDetailViewController"
    var presenter: MovieDetailPresenterProtocol?
    
    
    //MARK: Outlets.
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genresLable: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    //@IBOutlet var testingImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupNavigationItem()
        setupCollectionView()
    }
    
    
    func setupNavigationItem(){
        navigationItem.largeTitleDisplayMode = .never
        //navigationItem.title = "Detail"
    }
    
    func config(with movieViewModel: MovieViewModel) {
        titleLabel.text = movieViewModel.title
        yearLabel.text = movieViewModel.year
        genresLable.text = movieViewModel.genres
        castLabel.text = movieViewModel.cast
        // navigationItem.title = movieViewModel.title
    }
    
    func reloadData() {
        imagesCollectionView.reloadData()
    }
    
}

extension MovieDetailViewController : UICollectionViewDataSource, UICollectionViewDelegate{
   
    
    func setupCollectionView(){
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("URL Count ....... \(presenter!.numberOfImages)" )
        return presenter!.numberOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieImageCollectionViewCell.CellId, for: indexPath) as! MovieImageCollectionViewCell
        presenter?.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    
}

