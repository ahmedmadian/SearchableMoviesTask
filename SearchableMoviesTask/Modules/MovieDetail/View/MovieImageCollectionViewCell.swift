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
    
    
    func configure(viewModel: MovieImagesViewModel) {
        print("Configfgggggggggggggggggg")
        movieImage.kf.setImage(with: URL.init(string: viewModel.imageURl))
    }
    
    
}
