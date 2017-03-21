//
//  FirstDemoTests.swift
//  FirstDemoTests
//
//  Created by Christopher Myers on 3/21/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import XCTest
@testable import FirstDemo

class FirstDemoTests: XCTestCase {
    
    var vc : ViewController!
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_NumberOfVowels_WhenPassedDominik_ReturnsThree() {
        
        
        let string = "Dominik"
        
        let numberOfVowels = vc.numberOfVowels(in: string)
        
        XCTAssertEqual(numberOfVowels, 3, "should find 3 vowels in Dominik", file: "FirstDemoTests.swift", line: 24)
    }
    
    func test_MakeHeadline_ReturnsStringWithEachWordStartCapital() {
        
         let input = "this is A test headline"
        let expectedOutput = "This Is A Test Headline"
        
        let headline = vc.makeHeadline(from: input)
        
        XCTAssertEqual(headline, expectedOutput)
    }
    
    func test_MakeHeadline_RetursnStringWithEachWordStartCapital2() {
        let input = "Here is another Example"
        let expectedOutput = "Here Is Another Example"
        let headline = vc.makeHeadline(from: input)
        
        XCTAssertEqual(headline, expectedOutput)
    }
    
}
