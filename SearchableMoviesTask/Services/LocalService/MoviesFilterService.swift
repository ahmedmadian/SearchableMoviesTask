//
//  MoviesFilterService.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/23/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation

class MoviesFilterService{
    
    func getFilteredMovies(movies: [Movie], searchText: String) -> [Movie]? {
        var searchedArray = [Movie]()
        
        searchedArray = movies.filter{
             $0.title.lowercased().prefix(searchText.count) == searchText.lowercased()
        }
        /*
        var dictionary = Dictionary(grouping: searchedArray){$0.year}.sorted{ (aDic, bDic) -> Bool in
            return aDic.key < bDic.key
        }
 */
        
        return searchedArray
    }
}


/*
 searchedMovies = movies!.filter {
 $0.title.lowercased().prefix(searchText.count) == searchText.lowercased()
 }
 dic = Dictionary(grouping: searchedMovies){$0.year}
 let sortedaDic = dic.sorted { (aDic, bDic) -> Bool in
 return aDic.key < bDic.key
 }
 for e in sortedaDic{
 print(e.key)
 }
 print(dic.count)
 
 //print(dic)
 searching = true
 moviesTableView.reloadData()
 */
