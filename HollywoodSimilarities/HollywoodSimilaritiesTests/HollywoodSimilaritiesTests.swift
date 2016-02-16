//
//  HollywoodSimilaritiesTests.swift
//  HollywoodSimilaritiesTests
//
//  Created by Andrew McKinley on 2/11/16.
//  Copyright © 2016 Andrew McKinley. All rights reserved.
//

import XCTest
@testable import HollywoodSimilarities

class HollywoodSimilaritiesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    func testRetrievalService(){
        
        let getMovieExpectation = expectationWithDescription("getMovieWithName")
        
        MovieRetrievalService.getMovieWithName("Finding Nemo") { (_movies:[Movie]) -> Void in
            
            XCTAssertNotNil(_movies)
            XCTAssertGreaterThanOrEqual(_movies.count, 1)
            getMovieExpectation.fulfill()
            
        }
        
        let getCastExpectation = expectationWithDescription("getCastWithName")
        MovieRetrievalService.getCastOfMovie(withId: 12) { (_actors:[Actor]) -> Void in
            XCTAssertNotNil(_actors)
            XCTAssertGreaterThanOrEqual(_actors.count, 1)
            getCastExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(100000, handler: nil)
    }
    
    
}
