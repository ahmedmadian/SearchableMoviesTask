//
//  Dicitonary+Merge.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/26/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

extension Dictionary {
    
    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
    
    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
}
