//
//  MovieTableViewCell.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell, MoviesCellViewProtocol {
    
    

    //MARK: Properies.
    static let CellId = "MovieCell"
    
    //MARK: Outlets.
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(viewModel: MoviesViewModel) {
        titleLabel.text = "Title \(viewModel.title)"
        dateLabel.text = "Date: \(viewModel.year)"
    }

}
