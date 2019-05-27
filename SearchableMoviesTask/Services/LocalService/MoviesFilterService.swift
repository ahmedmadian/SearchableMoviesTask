//
//  MoviesFilterService.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

class MoviesFilterService{
    
    func getFilteredMovies(movies: [Movie], searchText: String) -> [(key: Int, value: [Movie])]? {
        var searchedArray = [Movie]()
        var result = [(key: Int, value: [Movie])]()
        searchedArray = movies.filter{
             $0.title.lowercased().prefix(searchText.count) == searchText.lowercased()
        }
        let keyValuePairs = Dictionary(grouping: searchedArray){$0.year}.sorted{ (aDic, bDic) -> Bool in
            return aDic.key < bDic.key
        }
        
      
        
        for (a, b) in keyValuePairs{
            result.append((key: a, value: Array(b.sorted{$0.rating > $1.rating}.prefix(5))))
        }
        
        
        return result
    }
}
