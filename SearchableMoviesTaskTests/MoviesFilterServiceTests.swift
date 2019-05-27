//
//  MoviesFilterServiceTests.swift
//  SearchableMoviesTaskTests
//
//  Created by Madian on 5/26/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import XCTest
@testable import SearchableMoviesTask

class MoviesFilterServiceTests: XCTestCase {

    var sut: MoviesFilterService!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = MoviesFilterService()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetFilteredMovies_GivenArrayOfMovies_returnSortedOrderdData(){
        let movies = [
            Movie(title: "A", year: 2000, cast: [], genres: [], rating: 1),
            Movie(title: "A", year: 2010, cast: [], genres: [], rating: 2),
            Movie(title: "A", year: 2010, cast: [], genres: [], rating: 3),
            Movie(title: "D", year: 2009, cast: [], genres: [], rating: 4),
            Movie(title: "E", year: 2005, cast: [], genres: [], rating: 5),
            Movie(title: "F", year: 2004, cast: [], genres: [], rating: 5),
            Movie(title: "G", year: 2003, cast: [], genres: [], rating: 1),
        ]
        
        let expectedResult = [
            (key: 2000, value: [SearchableMoviesTask.Movie(title: "A", year: 2000, cast: [], genres: [], rating: 1)]),
            (key: 2010, value: [SearchableMoviesTask.Movie(title: "A", year: 2010, cast: [], genres: [], rating: 3), SearchableMoviesTask.Movie(title: "A", year: 2010, cast: [], genres: [], rating: 2)])
        ]
        
        guard let searchedMovies = sut.getFilteredMovies(movies: movies, searchText: "A") else {return}
        print(searchedMovies)
        
        
    }

}
