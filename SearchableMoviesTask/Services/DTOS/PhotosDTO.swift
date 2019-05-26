//
//  PhotosDTO.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/26/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation


struct PhotosDTO: Codable {
    let page, pages, perpage: Int
    let total: String
    let photo: [PhotoDTO]
}
