//
//  MovieTableViewCell.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit
import Cosmos

class MovieTableViewCell: UITableViewCell, MoviesCellViewProtocol {
    
    

    //MARK: Properies.
    static let CellId = "MovieCell"
    
    //MARK: Outlets.
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingStarsView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ratingStarsView.settings.updateOnTouch = false
    }
    
    func configure(viewModel: MovieViewModel) {
        titleLabel.text = "\(viewModel.title)"
        ratingStarsView.rating = Double(viewModel.rating)
        ratingStarsView.text = "\(viewModel.rating)"
    }
    
    

}
