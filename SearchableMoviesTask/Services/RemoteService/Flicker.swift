//
//  Flicker.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/25/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

struct Flickr {
    static let APIScheme = "https"
    static let APIHost = "api.flickr.com"
    static let APIPath = "/services/rest"
    static var BaseURL : String {
        return "\(APIScheme)://\(APIHost)\(APIPath)"
    }
}

struct FlickrParameterKeys {
    static let Method = "method"
    static let APIKey = "api_key"
    static let Format = "format"
    static let NoJSONCallback = "nojsoncallback"
    static let Text = "text"
    static let Page = "page"
    static let PerPage = "per_page"
}

struct FlickrParameterValues {
    static let SearchMethod = "flickr.photos.search"
    static let APIKey = "70c8777b34f263822c768becf979fae8"
    static let ResponseFormat = "json"
    static let DisableJSONCallback = true
    static let GalleryID = "5704-72157622566655097"
}

