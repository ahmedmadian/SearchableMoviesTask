//
//  MovieModelTest.swift
//  SearchableMoviesTaskTests
//
//  Created by Madian on 5/27/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import XCTest
@testable import SearchableMoviesTask

class MovieModelTest: XCTestCase {

    var sut: Movie!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
        sut = Movie(title: "Avengers - End Game", year: 2018, cast: ["Robert Dawny Jr, Hamada Helal"], genres: ["Action", "Fantasy"], rating: 5)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testModel_Get_Set(){
        XCTAssertEqual(sut.title, "Avengers - End Game")
        XCTAssertEqual(sut.year, 2018)
        XCTAssertEqual(sut.cast, ["Robert Dawny Jr, Hamada Helal"])
        XCTAssertEqual(sut.genres, ["Action", "Fantasy"])
        XCTAssertEqual(sut.rating, 5)
    }
}
