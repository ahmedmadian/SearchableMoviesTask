//
//  FlickerResponseDTO.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/26/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

struct FlickerResponseDTO: Codable {
    let photos: PhotosDTO
    let stat: String
}
