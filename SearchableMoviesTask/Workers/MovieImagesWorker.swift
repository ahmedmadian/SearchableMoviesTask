//
//  MovieImagesWorker.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/26/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

class MovieImagesWorker {
     private let apiClient = FlickerApiClient.shared
    
    func execute(with movie: Movie, completion: @escaping (([PhotoDTO]?)) -> ()) {
        let parameters : [String : Any] = [FlickrParameterKeys.Text : movie.title,
                         FlickrParameterKeys.PerPage: 10
        ]
        
        apiClient.execute(endPoint: .photoSearch, method: .get, parameters: parameters) {(flickerResponseDTO: FlickerResponseDTO?, error) in
            completion(flickerResponseDTO?.photos.photo)
        }
    }
    
}
