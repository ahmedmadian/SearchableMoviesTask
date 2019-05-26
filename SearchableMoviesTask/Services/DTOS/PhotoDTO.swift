//
//  PhotoDTO.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/26/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

struct PhotoDTO: Codable {
    let id: String
    let owner: String
    let secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    
    var imageUrl: String {
        return "http://farm​\(farm)​.static.flickr.com/​\(server)/​\(id)​_​\(secret).jpg"
    }
}
