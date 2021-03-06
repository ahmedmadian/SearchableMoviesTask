//
//  MovieImageCollectionViewCell.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/26/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit
import Kingfisher

class MovieImageCollectionViewCell: UICollectionViewCell, MovieCollectionViewCellProtocol {
    
    
    //MARK: Properies.
    static let CellId = "MovieImageCell"
    
    //MARK: Outlets.
    @IBOutlet weak var movieImage: UIImageView!
   // @IBOutlet weak var spinner: UIActivityIndicatorView!

    
    func configure(viewModel: MovieImagesViewModel) {

      let testUrl = "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg"
        
        movieImage.kf.indicatorType = .activity
        movieImage.kf.setImage(with: URL.init(string: /*testUrl*/viewModel.imageURl), placeholder: UIImage(named: "placeholder"), options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
            ])
        {
            result in
            //self.spinner.stopAnimating()
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription) .... ")
            }
        }
    }
    
    
}
